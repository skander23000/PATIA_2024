

#dependances
dep1=../libs/org.sat4j.core.jar
dep2=../libs/pddl4j-4.0.0.jar
dep3=../libs/sat4j-sat.jar


pathRess=../src/test/resources/benchmarks/


main=SATPlanner #SATPlanner ProblemInstantiation etape1_to_etape2

echo "Lancement de $main"
cd classes

if [ $# -eq 0 ]; then
    java -cp .:$dep1:$dep2:$dep3 $main
elif [ $# -eq 2 ]; then
    java -cp .:$dep1:$dep2:$dep3 $main $pathRess$1.pddl $pathRess$2.pddl
elif [ $# -eq 3 ]; then
    java -cp .:$dep1:$dep2:$dep3 $main $pathRess$1.pddl $pathRess$2.pddl $3
else
    args=""
    for i in "$@"
    do
        args+=" $i"
    done
    java -cp .:$dep1:$dep2:$dep3 $main $args
fi


# ./start.sh robot_domain robot_problem
