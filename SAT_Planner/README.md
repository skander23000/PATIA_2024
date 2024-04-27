


# Scripts

Tous les autres scripts qui ne sont pas indiqués ici (.py et .sh) sont des scripts utilitaire pour ceux ci-dessous. 

**benchmarks.sh** :
 - Lance HSP et le planner sur les tests de ```src/test/resources/benchmarks/``` et enregistre les logs dans ```logs_benchmarks/``` . Le temps de recherche sur notre planner est indiqué à la ligne 13 des logs "Temps de recherche : XXX".


**benchmark_to_stats.sh** :
 - Parse tous les logs pour ne garder que le temps de recherche de HSP et de notre planner ainsi que la taille des plans

**sort_by_makespan_hsp.sh** :
 - Trie les données en fonction des performance de HSP

**create_gnuplots.sh**
 - Génère tout les graphes(par nombre d'étape et temps de recherche) dans ```gnuplot/```, les problèmes sont triés sur l'axe x en fonction des performance de HSP.
 



 # Resultat
 
 Un problème dans notre planner fait qu'il accepte dans certains cas des solutions fausses, ce qui construit un plan plus court que HSP. 