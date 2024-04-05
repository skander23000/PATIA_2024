package sokoban;

import fr.uga.pddl4j.heuristics.state.StateHeuristic;
import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.planners.InvalidConfigurationException;
import fr.uga.pddl4j.planners.LogLevel;
import fr.uga.pddl4j.planners.Planner;
import fr.uga.pddl4j.planners.PlannerConfiguration;
import fr.uga.pddl4j.planners.statespace.HSP;
import fr.uga.pddl4j.problem.operator.Action;

import java.io.*;

public class Agent {

    // The path to the benchmarks directory
    static final String benchmarks = "src/test/resources/benchmarks/pddl/";

    public static void main(String[] args) {
        // try to load solution exist
        String testFile = SokobanMain.pddl_file; // Valeur par défaut
        //lire le ppdl_file depuis le fichier txt
        try (BufferedReader reader = new BufferedReader(new FileReader("config.txt"))) {
            testFile = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }

        String solution = loadSolution(testFile);
        //System.out.println("read:" + testFile);
        //System.out.println("solution:"+solution);
        // if(solution==null) {
        //     solution = solve_problem(SokobanMain.pddl_file);//"ULUURDDRDDLLUURRDLUUULLLDDRRLLUURRRDD";
        //     System.out.println(solution);
        //     saveSolution(solution);
        // }
        //
        for (char c : solution.toCharArray()) System.out.println(c);
    }

    public static String getDirPath() {
        return benchmarks;
    }

    public static void solve_and_save(String problem_file) {
        String solution = solve_problem(problem_file);
        if(!solution.isEmpty()) {
            saveSolution(solution);
        }
    }

    private static String solve_problem(String problem_file){
        // Gets the default configuration from the planner
        PlannerConfiguration config = HSP.getDefaultConfiguration();
        // Sets the domain of the problem to solve
        config.setProperty(HSP.DOMAIN_SETTING, benchmarks + "domain.pddl");
        // Sets the problem to solve
        config.setProperty(HSP.PROBLEM_SETTING, benchmarks + problem_file);
        // Sets the timeout allocated to the search.
        config.setProperty(HSP.TIME_OUT_SETTING, 1000);
        // Sets the log level
        config.setProperty(HSP.LOG_LEVEL_SETTING, LogLevel.OFF);
        // Sets the heuristic used to search
        config.setProperty(HSP.HEURISTIC_SETTING, StateHeuristic.Name.MAX);
        // Sets the weight of the heuristic
        config.setProperty(HSP.WEIGHT_HEURISTIC_SETTING, 1.2);

        // Creates an instance of the HSP planner with the specified configuration
        Planner planner = Planner.getInstance(Planner.Name.HSP, config);

        // Runs the planner and print the solution
        String actions_str = null;
        try {
            Plan plan = planner.solve();
            actions_str = translateToActions(plan);
        } catch (InvalidConfigurationException e) {
            e.printStackTrace();
        }
        return actions_str;
    }

    private static String translateToActions(Plan plan) {
        StringBuilder builder = new StringBuilder();
        //System.out.println("size: "+plan.size());
        if(!plan.isEmpty()){
            //System.out.println("----- actions ------");
            for(Action action : plan.actions()){
                //System.out.println(action.getName());
                if(action.getName().contains("up")){
                    builder.append("U");
                }else if(action.getName().contains("down")){
                    builder.append("D");
                }else if(action.getName().contains("left")){
                    builder.append("L");
                }else if(action.getName().contains("right")){
                    builder.append("R");
                }
            }
        }
        return builder.toString();
    }

    private static String loadSolution(String param) {
        String solution = null;
        File file = new File(benchmarks + param + ".out");
        if(file.exists()) {
            try {
                BufferedReader reader = new BufferedReader(new FileReader(file));
                solution = reader.readLine();
//                System.out.println(solution);
                reader.close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        return solution;
    }

    private static void saveSolution(String solution) {
        File file = new File(benchmarks + SokobanMain.pddl_file + ".out");
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(file));
            writer.write(solution);
            writer.flush();
            writer.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
