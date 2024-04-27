import fr.uga.pddl4j.parser.DefaultParsedProblem;
import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.plan.SequentialPlan;
import fr.uga.pddl4j.planners.AbstractPlanner;
import fr.uga.pddl4j.problem.DefaultProblem;
import fr.uga.pddl4j.problem.Fluent;
import fr.uga.pddl4j.problem.InitialState;
import fr.uga.pddl4j.problem.Problem;
import fr.uga.pddl4j.problem.operator.Action;
import fr.uga.pddl4j.util.BitVector;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.sat4j.core.VecInt;
import org.sat4j.maxsat.SolverFactory;
import org.sat4j.specs.ContradictionException;
import org.sat4j.specs.IProblem;
import org.sat4j.specs.ISolver;
import org.sat4j.specs.TimeoutException;
import picocli.CommandLine;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.io.PrintWriter;
import java.time.Instant;
import java.time.Duration;

/**
 * The class is an example. It shows how to create a simple A* search planner
 * able to
 * solve an ADL problem by choosing the heuristic to used and its weight.
 *
 * @author D. Pellier
 * @version 4.0 - 30.11.2021
 */
@CommandLine.Command(name = "SAT",
        version = "SAT 1.0",
        description = "Solves a specified planning problem using SAT search strategy.",
        sortOptions = false,
        mixinStandardHelpOptions = true,
        headerHeading = "Usage:%n",
        synopsisHeading = "%n",
        descriptionHeading = "%nDescription:%n%n",
        parameterListHeading = "%nParameters:%n",
        optionListHeading = "%nOptions:%n")
public class SATPlanner extends AbstractPlanner {
    int maxSteps = 100;
    /**
     * The class logger.
     */
    private static final Logger LOGGER = LogManager.getLogger(SATPlanner.class.getName());

    /**
     * Instantiates the planning problem from a parsed problem.
     *
     * @param problem the problem to instantiate.
     * @return the instantiated planning problem or null if the problem cannot be
     *         instantiated.
     */
    @Override
    public Problem instantiate(DefaultParsedProblem problem) {
        final Problem pb = new DefaultProblem(problem);
        pb.instantiate();
        return pb;
    }

    public void setMaxSteps(int maxSteps) {
        this.maxSteps = maxSteps;
    }
    /**
     * Search a solution plan to a specified domain and problem using A*.
     *
     * @param problem the problem to solve.
     * @return the plan found or null if no plan was found.
     */
    @Override
    public Plan solve(final Problem problem) {
        Instant startTime = Instant.now();
        Plan solutionPlan = new SATEncoding().findSolution(problem, maxSteps);
        Instant endTime = Instant.now();
        Duration duration = Duration.between(startTime, endTime);
        double timeInSeconds = (double) duration.toMillis() / 1000;
        System.out.println("Temps de recherche : "+timeInSeconds);
        return solutionPlan;
    }

    @Override
    public boolean isSupported(Problem problem) {
        return false;
    }

    /**
     * The main method of the <code>SATPlanner</code> planner.
     *
     * @param args the arguments of the command line.
     */
    public static void main(String[] args) {
        try {
            final SATPlanner planner = new SATPlanner();

            // obtenir les fichiers par arguments
            String domainFile = null;
            String pbmFile = null;

            if(args.length>=2){
                domainFile = args[0];
                pbmFile = args[1];
            }else{
                System.out.println("Usage: SATPlanner <domain-file> <pbm-file>");
                return;
            }
            if (args.length>=3) {
                planner.setMaxSteps(Integer.valueOf(args[2]));
                System.out.println("setMaxSteps :"+args[2]);
            }

            CommandLine cmd = new CommandLine(planner);
            System.out.println("domainFile :"+domainFile);
            System.out.println("pbmFile :"+pbmFile);

            cmd.execute(new String[]{domainFile, pbmFile});
        } catch (IllegalArgumentException e) {
            LOGGER.fatal(e.getMessage());
        }
    }

}