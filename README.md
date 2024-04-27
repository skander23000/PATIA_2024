# PATIA_2024
# Exercices
Pour lancer les exercices : 

```bash
cd EXERCICE_PDDL

chmod +x run_exercice.sh
./run_exercice.sh nom_de_dossier_du_probleme
(exemple : /run_exercice.sh Graph-Coloring)
```
# Sokoban
```bash
cd SOKOBAN

chmod +x run_project.sh
./run_project.sh nom_du_test
(exemple : ./run_project.sh test15)
```
Consultez "http://localhost:8888/test.html"

# SAT-Planner

## Compilation
```bash
cd SAT_Planner

chmod +x compile.sh
./compile.sh
```
## Execution
 Tout les graphes sont deja génère (par nombre d'étape et temps de recherche) dans ```gnuplot/```, les problèmes sont trié sur l'axe x en fonction des performance de HSP.
 


 Pour lancer HSP et le SATplanner sur les tests de ```src/test/resources/benchmarks/``` et enregistrer les logs dans ```logs_benchmarks/``` . 
 (Le temps de recherche sur notre planner est indiqué à la ligne 13 des logs "Temps de recherche : XXX".)
 
```bash
chmod +x benchmarks.sh
./benchmarks.sh
```


## Resultat
 
 Un problème dans notre planner fait qu'il accepte dans certains cas des solutions fausse, ce qui construit un plan plus court que HSP. 
 



