import org.sat4j.core.VecInt;
import org.sat4j.maxsat.SolverFactory;
import org.sat4j.specs.ContradictionException;
import org.sat4j.specs.IProblem;
import org.sat4j.specs.ISolver;
import org.sat4j.specs.TimeoutException;

/* un test de SAT sur l'exemple de robot */
public class TestSAT4J {

    static final int[][] data = { // a 1, b 2, c 3, d 4, e 5, f 6
            {-1, -2}, // -a or -b
            {-3, -4, 2}, // -c or -d or b
            {5, -6, 1}, // e or -f or a
            {-3, 4, 1}, // -c or d or a
            {-5, 6, 2}, // -e or f or b
            {-1, 3}, // -a or c
            {-1, 6}, // -a or f
            {-1, -4}, // -a or -d
            {-2, 5}, // -b or e
            {-2, 4}, // -b or d
            {-2, -6}, // -b or -f
            {6}, // f
            {-4}, // -d
            {3}, // c
            {-5}  // -e
    };

    public static void main(String[] args) {
        try {
            ISolver solver = SolverFactory.newDefault();

    //        // prepare the solver to accept MAXVAR variables. MANDATORY for MAXSAT solving
    //        solver.newVar(MAXVAR);
    //        solver.setExpectedNumberOfClauses(NBCLAUSES);

            // Feed the solver using Dimacs format, using arrays of int
            // (best option to avoid dependencies on SAT4J IVecInt)
            for (int i=0; i<data.length; i++) {
                int [] clause = data[i];// get the clause from somewhere
                // the clause should not contain a 0, only integer (positive or negative)
                // with absolute values less or equal to MAXVAR
                // e.g. int [] clause = {1, -3, 7}; is fine
                // while int [] clause = {1, -3, 7, 0}; is not fine
                solver.addClause(new VecInt(clause)); // adapt Array to IVecInt
            }

            // we are done. Working now on the IProblem interface
            IProblem problem = solver;
            if (problem.isSatisfiable()) {
                //...
                for(int i : problem.model()){
                    System.out.print(i+",");
                }
            }
        } catch (TimeoutException | RuntimeException | ContradictionException e) {
            throw new RuntimeException(e);
        }
    }

}
