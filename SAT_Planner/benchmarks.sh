#dependances
dep1=../libs/org.sat4j.core.jar
dep2=../libs/pddl4j-4.0.0.jar
dep3=../libs/sat4j-sat.jar


pathRess=./src/test/resources/benchmarks/
pathblocks="blocks-typed/"
pathdepot="depot-automatic/"
pathgripper="gripper/"
pathlogistics="logistics-round1/"


nbpb_blocks=102
nbpb_depot=22
nbpb_gripper=20
nbpb_logistics=20



pddl4j="java -server -Xms4096m -Xmx4096m -cp ./libs/pddl4j-4.0.0.jar fr.uga.pddl4j.planners.statespace."
HSP="HSP"
FF="FF"


solverMaison="java -cp .:$dep1:$dep2:$dep3 SATPlanner"
solverHSP="$pddl4j$HSP"
solverFF="$pddl4j$FF"


dom="domain.pddl"

nbStepMax=500

#RESET

#rm -rf logs_benchmarks
#mkdir logs_benchmarks
#cd logs_benchmarks
#mkdir blocks
#mkdir gripper 
#mkdir depot 
#mkdir logistics
#cd ..








echo "================ logistics ================"

#Boucle pour logistics
for problm in "$pathRess$pathlogistics"p*; do
    if [ -f "$problm" ]; then
        echo "Traitement de : $problm"
        $solverHSP $pathRess$pathlogistics$dom $problm > logs_benchmarks/logistics/HSP_$(basename $problm) &
        echo
        cd classes
        $solverMaison "."$pathRess$pathlogistics$dom "."$problm $nbStepMax > "../"logs_benchmarks/logistics/Maison_$(basename $problm)
        cd ..
    fi
done



echo "================ blocks ================"

#Boucle pour blocks
for problm in "$pathRess$pathblocks"p*; do
    if [ -f "$problm" ]; then
        echo "Traitement de : $problm"
        # shellcheck disable=SC2046
        $solverHSP $pathRess$pathblocks$dom $problm > logs_benchmarks/blocks/HSP_$(basename "$problm")
        echo
        cd classes
        # shellcheck disable=SC2046
        $solverMaison "."$pathRess$pathblocks$dom "."$problm $nbStepMax > "../"logs_benchmarks/blocks/Maison_$(basename "$problm") 
        cd ..
    fi
done


echo "================ gripper ================"

#Boucle pour gripper
for problm in "$pathRess$pathgripper"p*; do
    if [ -f "$problm" ]; then
        echo "Traitement de : $problm"
        $solverHSP $pathRess$pathgripper$dom $problm > logs_benchmarks/gripper/HSP_$(basename $problm)
        echo
        cd classes
        $solverMaison "."$pathRess$pathgripper$dom "."$problm $nbStepMax > "../"logs_benchmarks/gripper/Maison_$(basename $problm)
        cd ..
    fi
done


echo "================ depot ================"

#Boucle pour blocks
for problm in "$pathRess$pathdepot"p*; do
    if [ -f "$problm" ]; then
        echo "Traitement de : $problm"
        $solverHSP $pathRess$pathdepot$dom $problm > logs_benchmarks/depot/HSP_$(basename $problm) &
        echo
        cd classes
        $solverMaison "."$pathRess$pathdepot$dom "."$problm $nbStepMax > "../"logs_benchmarks/depot/Maison_$(basename $problm)
        cd ..
    fi
done