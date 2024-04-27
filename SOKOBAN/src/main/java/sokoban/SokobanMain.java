package sokoban;

import com.codingame.gameengine.runner.SoloGameRunner;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import org.apache.commons.io.FilenameUtils;
import sokoban.solver.ProblemParser;

public class SokobanMain {

    // nom de fichier json
    static String test_file = "test1.json";

    // nom de fichier pddl généré
    public static String pddl_file = FilenameUtils.getBaseName(test_file) + ".pddl";

    public static void main(String[] args) {
        // obtenir le fichier via les params
        if (args.length != 0) {
            test_file = args[0].trim();
            pddl_file = FilenameUtils.getBaseName(test_file) + ".pddl";
        }

        // on écrit le pddl_file dans un fichier text pour pouvoir le lire depuis l'agent
        // dans le but de résoudre certain problème de dépendence des biliothèques
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("config.txt"))) {
            writer.write(pddl_file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(pddl_file);
        System.out.println(test_file);

        // passer JSON vers PDDL
        ProblemParser parser = new ProblemParser();
        parser.parse(test_file, Agent.getDirPath() + pddl_file);

        // solve
        Agent.solve_and_save(pddl_file);

        // execute game
        SoloGameRunner gameRunner = new SoloGameRunner();
        gameRunner.setAgent(Agent.class);
        gameRunner.setTestCase(test_file);

        gameRunner.start();
    }
}
