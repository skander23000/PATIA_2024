 
mkdir classes > /dev/null 2>&1
rm classes/* > /dev/null 2>&1
#javac -d classes src/*.java

dep1=libs/org.sat4j.core.jar
dep2=libs/pddl4j-4.0.0.jar
dep3=libs/sat4j-sat.jar

#peut-etre rajouter les autres .jar plus tard
if javac -d classes -cp .:$dep1:$dep2:$dep3 src/*.java; then
    echo ".class compilé"
else
    echo "La compilation a échoué"
fi


