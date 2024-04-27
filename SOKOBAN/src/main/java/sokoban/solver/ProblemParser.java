package sokoban.solver;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Un parser d'un problème en format JSON vers en format PDDL
 * pour ce qui pourrait être résolu par un planner de PDDL
 */
public class ProblemParser {

    /**
     * Transformer JSON en PDDL
     * @param json_file  fichier de test en JSON
     * @param pddl_file  fichier de sorti en PDDL
     */
    public void parse(String json_file, String pddl_file) {
        File test_file = new File(System.getProperty("user.dir")).toPath()
                .resolve("config/" + json_file).toFile();

        // lire les données de JSON dans une structure
        TestCase testCase = loadTestCase(test_file);
        if (testCase.getTestIn() == null) {
            throw new RuntimeException("Cannot find \"testIn\" property");
        }

        /*
         * Construction de PDDL
         */

        // map title
        String title = FilenameUtils.getBaseName(pddl_file);//testCase.title.get(2);

        // map data
        List<String> mapData = Arrays.asList(testCase.getTestIn().split("\\n"));

        int nb_rows = mapData.size();
        int nb_cols = 0;
        for (String line : mapData) nb_cols = Math.max(nb_cols, line.length());
        //System.out.println("nb_rows:"+nb_rows+", nb_cols:"+nb_cols);

        StringBuilder buffer = new StringBuilder();

        // define
        buffer.append("(define (problem sokoban-").append(title).append(")\n");

        // domain
        buffer.append("(:domain sokoban)\n");

        // objects
        buffer.append("(:objects\n");
        for(int row=0; row<nb_rows; row++){
            for(int col=0; col<nb_cols; col++){
                buffer.append(getCaseName(row, col)).append(" - case\n");
            }
        }
        buffer.append(")\n");

        // init
        buffer.append("(:init ");
        for(int row=0; row<nb_rows; row++){
            for(int col=0; col<nb_cols-1; col++){
                buffer.append("(on-left ").append(getCaseName(row, col)).append(" ")
                        .append(getCaseName(row, col+1)).append(") ");
                buffer.append("(on-right ").append(getCaseName(row, col+1)).append(" ")
                        .append(getCaseName(row, col)).append(") ");
            }
            buffer.append('\n');
        }

        for(int row=0; row<nb_rows-1; row++){
            for(int col=0; col<nb_cols; col++){
                buffer.append("(on-top ").append(getCaseName(row, col)).append(" ")
                        .append(getCaseName(row+1, col)).append(") ");
                buffer.append("(on-down ").append(getCaseName(row+1, col)).append(" ")
                        .append(getCaseName(row, col)).append(") ");
            }
            buffer.append('\n');
        }

        List<String> goal_list = new ArrayList<>();
        for(int row=0; row<nb_rows-1; row++){

            String line = mapData.get(row);
            for(int col=0; col<line.length(); col++){

                char c = line.charAt(col);
                String caseName = getCaseName(row, col);
                switch (c) {
                    case '#': // wall
                        buffer.append("(wall ").append(caseName).append(") ");
                        break;

                    case ' ': // empty
                        buffer.append("(empty ").append(caseName).append(") ");
                        break;

                    case '$': // box
                        buffer.append("(box ").append(caseName).append(") ");
                        break;

                    case '.': // goal
                        buffer.append("(empty ").append(caseName).append(") ");
                        buffer.append("(goal ").append(caseName).append(") ");
                        goal_list.add(caseName);
                        break;

                    case '@': // person
                        buffer.append("(person ").append(caseName).append(") ");
                        break;

                    case '*': // box on goal
                        buffer.append("(box ").append(caseName).append(") ");
                        buffer.append("(goal ").append(caseName).append(") ");
                        buffer.append("(reach-goal ").append(caseName).append(") ");
                        goal_list.add(caseName);
                        break;

                    case '+': // person on goal
                        buffer.append("(person ").append(caseName).append(") ");
                        buffer.append("(goal ").append(caseName).append(") ");
                        goal_list.add(caseName);
                        break;
                }
            }
            buffer.append('\n');
        }
        buffer.append(")\n");

        // goal
        buffer.append("(:goal (and ");
        for(String goal_case : goal_list){
            buffer.append("(reach-goal ").append(goal_case).append(") ");
        }
        buffer.append("))\n");

        buffer.append(")");

        //System.out.println(buffer);

        // écrire les données dans un fichier PDDL
        File outFile = new File(pddl_file);
        try {
            FileWriter writer = new FileWriter(outFile);
            writer.write(buffer.toString());
            writer.flush();
            writer.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private String getCaseName(int row, int col) {
        return "c"+row+"_"+col;
    }

    private TestCase loadTestCase(File file) {
        TestCase testCase;
        try {
            testCase = parseTestCaseFile(file);
        } catch (IOException e) {
            throw new RuntimeException("Cannot read file " + file.getName(), e);
        } catch (Exception e) {
            throw new RuntimeException("Cannot parse file " + file.getName(), e);
        }
        return testCase;
    }

    /**
     * Structure pour un fichier de test en JSON
     */
    public static class TestCase {
        private Map<Integer, String> title;
        private String testIn;
        private Boolean isTest;
        private Boolean isValidator;

        public Map<Integer, String> getTitle() {
            return title;
        }

        public String getTestIn() {
            return testIn;
        }

        public Boolean getIsTest() {
            return isTest;
        }

        public Boolean getIsValidator() {
            return isValidator;
        }

        public void setTitle(Map<Integer, String> title) {
            this.title = title;
        }

        public void setTestIn(String testIn) {
            this.testIn = testIn;
        }

        public void setIsTest(Boolean isTest) {
            this.isTest = isTest;
        }

        public void setIsValidator(Boolean isValidator) {
            this.isValidator = isValidator;
        }
    }

    public static TestCase parseTestCaseFile(File file) throws JsonSyntaxException, IOException {
        return new Gson().fromJson(FileUtils.readFileToString(file, StandardCharsets.UTF_8), TestCase.class);
    }

}
