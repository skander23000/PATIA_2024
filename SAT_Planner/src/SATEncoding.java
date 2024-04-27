import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.sat4j.specs.TimeoutException;
import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.plan.SequentialPlan;
import fr.uga.pddl4j.problem.operator.Action;
import fr.uga.pddl4j.problem.Problem;
import org.sat4j.core.VecInt;
import fr.uga.pddl4j.util.BitVector;
import org.sat4j.maxsat.SolverFactory;
import org.sat4j.specs.ContradictionException;
import org.sat4j.specs.ISolver;

public class SATEncoding {

    HashMap<String, Integer> translation ;
    HashMap<String, Integer> translationAction ;

    private int lastDigitAdded;

    public SATEncoding() {
        translation = new HashMap<>();  //hashmap des
        translationAction = new HashMap<>();
        lastDigitAdded = 1;
    }
    
    public Plan findSolution(Problem problem, int maxSteps) {
        ArrayList<VecInt> clauses = new ArrayList<>();
        ArrayList<VecInt> goal = new ArrayList<>();

        int step = 0;

        // état initial
        BitVector bitFluents = problem.getInitialState().getPositiveFluents();
        //System.out.println("init:"+bitFluents);
        // vérifier les quels fluents sont valides dans l'état inital
        // on peut faire avec un boucle car l'index des fluents est de 0 .. n
        for(int i=0; i<problem.getFluents().size(); i++){
            int bit = getNumFromIdxStep(i, step);
            if(bitFluents.get(i)){
                clauses.add(new VecInt(new int[]{bit}));
            }else{
                clauses.add(new VecInt(new int[]{-bit}));
            }
        }



        while(step<maxSteps) {
            step += 1;

            executeStep(problem, clauses, goal, step);

            //System.out.println("Step:"+step+" Clauses : " + clauses.size() + " Goals : " + goal.size());
            ISolver solver = SolverFactory.newDefault();
            try {
                for (VecInt vi : clauses) {
                    solver.addClause(vi);
                }
                for (VecInt vi : goal) {
                    solver.addClause(vi);
                }
                if(solver.isSatisfiable()){
                    //for (int i : solver.model()) {
                    //    System.out.print(i + ",");
                    //}
                    //System.out.println();
                    return getPlan(solver.model(), problem);
                }
            } catch (ContradictionException | TimeoutException e) {
                e.fillInStackTrace();
            }
        }
        return null;
    }

    private void executeStep(Problem problem, ArrayList<VecInt> clauses, ArrayList<VecInt> goal, int step) {
        goal.clear();
        // état final
        BitVector bitGoal = problem.getGoal().getPositiveFluents();
        //System.out.println("goal:"+bitGoal);
        for(int i=0; i<problem.getFluents().size(); i++){
            int bit = getNumFromIdxStep(i, step);
            if(bitGoal.get(i)){
                goal.add(new VecInt(new int[]{bit}));
            }/*else{
                goal.add(new VecInt(new int[]{-bit}));
            }*/
            //Pas de clauses negative dans la solution
        }

        // actions
        // Affiche la liste des actions du probleme
        for (int i=0; i<problem.getActions().size(); i++) {
            Action a = problem.getActions().get(i);
            // System.out.println(problem.toString(a));
            String name = a.getName();

            BitVector bitPrecondition = a.getPrecondition().getPositiveFluents();
            BitVector bitEffectPositive = a.getUnconditionalEffect().getPositiveFluents();
            BitVector bitEffectNegative = a.getUnconditionalEffect().getNegativeFluents();

            for(int j=0; j<bitEffectPositive.size(); j++){
                // precondition
                if(bitPrecondition.get(j)){
                    clauses.add(new VecInt(new int[]{
                            -indexAndStepToInt_Action(i, step-1),
                            getNumFromIdxStep(j, step-1)}));
                }
                // effets positifs
                if(bitEffectPositive.get(j)){
                    clauses.add(new VecInt(new int[]{
                            -indexAndStepToInt_Action(i, step-1),
                            getNumFromIdxStep(j, step)}));
                }
                // effets negatifs
                if(bitEffectNegative.get(j)){
                    clauses.add(new VecInt(new int[]{
                            -indexAndStepToInt_Action(i, step-1),
                            -getNumFromIdxStep(j, step)}));
                }
            }
        }

        // transitions
        for(int fluentIndex = 0; fluentIndex < problem.getFluents().size(); fluentIndex++ ) {
            // pour chaque fluent
            ArrayList<Integer> positiveActionEffect = new ArrayList<>();
            ArrayList<Integer> negativeActionEffect = new ArrayList<>();

            for(int actionIndex=0; actionIndex<problem.getActions().size(); actionIndex++) {
                // pour chaque action
                Action action = problem.getActions().get(actionIndex);
                BitVector actionPositives = action.getUnconditionalEffect().getPositiveFluents();
                BitVector actionNegatives = action.getUnconditionalEffect().getNegativeFluents();
                // si l'action a un effet positif
                if(actionPositives.get(fluentIndex)) {
                    positiveActionEffect.add(actionIndex); // l'ajoute a la liste d'actions positives
                } else if(actionNegatives.get(fluentIndex)) {
                    negativeActionEffect.add(actionIndex);
                }
            }

            // si il y avait des effets positifs
            if(!positiveActionEffect.isEmpty()) {
                int[] positiveEffectClause = new int[positiveActionEffect.size() + 2];

                // ce fluent est faux à cette étape
                positiveEffectClause[0] = -getNumFromIdxStep(fluentIndex, step);
                // ou c'était vrai à l'étape d'avant
                positiveEffectClause[1] = getNumFromIdxStep(fluentIndex, step-1);
                // pour chaque effet positif
                for(int i=0;i<positiveActionEffect.size();i++) {
                    // les positifs doivent être vrai à l'étape d'avant
                    positiveEffectClause[i+2] = indexAndStepToInt_Action(positiveActionEffect.get(i), step-1);
                }
                clauses.add(new VecInt(positiveEffectClause));
            }

            // si il n'y a pas d'effets négatifs
            if(!negativeActionEffect.isEmpty()) {
                int[] negativeEffectClause = new int[negativeActionEffect.size() + 2];

                // le fluent est vrai à l'étape courrante
                negativeEffectClause[0] = getNumFromIdxStep(fluentIndex, step);
                // ou fausse à l'étape d'avant
                negativeEffectClause[1] = -getNumFromIdxStep(fluentIndex, step-1);
                for(int i=0;i<negativeActionEffect.size();i++) {
                    negativeEffectClause[i+2] = indexAndStepToInt_Action(negativeActionEffect.get(i), step-1);
                }
                clauses.add(new VecInt(negativeEffectClause));
            }
        }

        // disjonction des actions
        for(int i=0;i<problem.getActions().size();i++) {
            for(int j=0;j<problem.getActions().size();j++) {
                if(i!=j) {
                    clauses.add(new VecInt(new int[] {
                            -indexAndStepToInt_Action(i, step-1),
                            -indexAndStepToInt_Action(j, step-1)
                    }));
                }
            }
        }
    }
    public static int cantor(int num, int step) {
        // pour éviter quand entrée est 0, 0 rendre 0, mais 1
        num++;
        step++;
        return (num + step) * (num + step - 1) / 2 + step - 1;
    }

    public int getNumFromIdxStep(int number, int step) {
        int isNegative = 1;
        int numberr = number;
        if (number < 0) {
            isNegative = -1;
            numberr = -number;
        }
        String key = ""+step+"_"+numberr;
        if (!translation.containsKey(key)) {
            translation.put(key, lastDigitAdded);
            lastDigitAdded += 1;
        }
        return isNegative*translation.get(key);
    }

    public int indexAndStepToInt_Action(int number, int step) {
        int isNegative = 1;
        int numberr = number;
        if (number < 0) {
            isNegative = -1;
            numberr = -number;
        }
        String key = ""+step+"_"+numberr;
        if (!translationAction.containsKey(key)) {
            translationAction.put(key, lastDigitAdded);
            lastDigitAdded += 1;
        }
        return isNegative*translationAction.get(key);
    }

    /**
     * Decoder
     * @param model
     * @param problem
     * @return
     */
    public Plan getPlan(int[] model, Problem problem) {
        Plan plan = new SequentialPlan();
        for (int index : model) {
            if (index > 0 ) {
                //System.out.println(" -> getPlan : * "+index);
                String keySolver = translateAction(index);
                if (!keySolver.equals("0")) {
                    String[] keys = keySolver.split("_");
                    plan.add(Integer.valueOf(keys[0]), problem.getActions().get(Integer.valueOf(keys[1])));
                } // sinon il y a une erreur quelque part, mais assumons que ça n'arrive jamais
                else{
                    //System.out.println("prédicat");
                }
            }

        }
        return plan;
    }

    private String translateAction(int index) {
        for (Map.Entry<String, Integer> entry : this.translationAction.entrySet()) {
            if (entry.getValue() == index) {
                return entry.getKey();
            }
        }
        return "0";
    }

}