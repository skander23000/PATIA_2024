# PATIA_2024

# Exercices
Pour lancer les exercices : 

```bash
cd EXERCICE_PDDL

./run_exercice.sh <nom_de_dossier_du_probleme> 
# exemple: ./run_exercice.sh Graph-Coloring
```
# Sokoban
```bash
cd SOKOBAN

./run_project.sh <nom_du_test>
# exemple: ./run_project.sh test15
```
Ensuite, vous pouvez consulter la page : "http://localhost:8888/test.html"

# SAT-Planner

## Compilation
```bash
cd SAT_Planner

./compile.sh
```
## Execution
 Tout les graphes sont deja génère (par nombre d'étape et temps de recherche) dans ```gnuplot/```, les problèmes sont trié sur l'axe x en fonction des performance de HSP.
 


 Pour lancer HSP et le SATplanner sur les tests de ```src/test/resources/benchmarks/``` et enregistrer les logs dans ```logs_benchmarks/``` . 
 (Le temps de recherche sur notre planner est indiqué à la ligne 13 des logs "Temps de recherche : XXX".)
 
```bash
./benchmarks.sh
```


## Resultats
Une version pdf des résultats est présente à la racine du projet sous graphes.pdf
 
 Sur les graphes du runtime, si la courbe de HSP n'est pas visible c'est quelle est beaucoup plus petite (0,01~0.05 sec).

 Un problème dans notre planner est qu'il accepte dans certains cas des solutions fausse, ce qui construit un plan plus court que HSP. 
 



