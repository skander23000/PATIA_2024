(define (domain npuzzle)
    (:requirements :strips :typing)  ; Utilise les capacités de base de STRIPS et le typage pour les variables.

    (:types tile x y)  ; Définit trois types d'objets : 'tile' pour les tuiles, 'x' et 'y' pour les coordonnées.

    (:predicates
        (estVide ?x - tile)  ; Prédicat pour indiquer qu'une tuile est vide (emplacement vide dans le puzzle).
        (biggerThan ?x - tile ?y - tile)  ; Comparaison de taille entre deux tuiles, non utilisé dans les actions standards.
        (coordonees ?t - tile ?x - x ?y - y)  ; Définit les coordonnées d'une tuile sur la grille.
        (xplusone ?x - x ?x2 - x)  ; Indique que ?x2 est la coordonnée immédiatement à droite de ?x.
        (yplusone ?y - y ?y2 - y)  ; Indique que ?y2 est la coordonnée immédiatement en dessous de ?y.
        (xsame ?x - x ?x2 - x)  ; Vérifie si deux tuiles sont dans la même colonne.
        (ysame ?y - y ?y2 - y)  ; Vérifie si deux tuiles sont dans la même ligne.
    )

    (:action moveleft  ; Action pour déplacer une tuile vers la gauche.
        :parameters (?t1 - tile ?t2 - tile ?x - x ?y - y ?x2 -x ?y2 - y)  ; Paramètres incluant les tuiles et leurs coordonnées.
        :precondition (and
            (estVide ?t2)  ; La tuile ?t2 doit être vide.
            (coordonees ?t1 ?x ?y)  ; La tuile ?t1 doit être à la position (?x, ?y).
            (coordonees ?t2 ?x2 ?y2)  ; La tuile ?t2 doit être à la position (?x2, ?y2).
            (ysame ?y ?y2)  ; Les tuiles ?t1 et ?t2 doivent être sur la même ligne.
            (xplusone ?x2 ?x))  ; La tuile ?t2 doit être immédiatement à gauche de ?t1.
        :effect (and
            (coordonees ?t2 ?x ?y)  ; Déplace ?t2 à la position de ?t1.
            (coordonees ?t1 ?x2 ?y2)  ; Déplace ?t1 à la position de ?t2.
            (not (coordonees ?t1 ?x ?y))  ; Efface l'ancienne position de ?t1.
            (not (coordonees ?t2 ?x2 ?y2))  ; Efface l'ancienne position de ?t2.
            )
    )

    (:action moveright  ; Action pour déplacer une tuile vers la droite.
        :parameters (?t1 - tile ?t2 - tile ?x - x ?y - y ?x2 -x ?y2 - y)
        :precondition (and
            (estVide ?t2)
            (coordonees ?t1 ?x ?y)
            (coordonees ?t2 ?x2 ?y2)
            (ysame ?y ?y2)
            (xplusone ?x ?x2))
        :effect (and
            (coordonees ?t2 ?x ?y)
            (coordonees ?t1 ?x2 ?y2)
            (not (coordonees ?t1 ?x ?y))
            (not (coordonees ?t2 ?x2 ?y2))
            )
    )

    (:action movedown  ; Action pour déplacer une tuile vers le bas.
        :parameters (?t1 - tile ?t2 - tile ?x - x ?y - y ?x2 -x ?y2 - y)
        :precondition (and
            (estVide ?t2)
            (coordonees ?t1 ?x ?y)
            (coordonees ?t2 ?x2 ?y2)
            (xsame ?x ?x2)
            (yplusone ?y ?y2))
        :effect (and
            (coordonees ?t2 ?x ?y)
            (coordonees ?t1 ?x2 ?y2)
            (not (coordonees ?t1 ?x ?y))
            (not (coordonees ?t2 ?x2 ?y2))
            )
    )

    (:action moveup  ; Action pour déplacer une tuile vers le haut.
        :parameters (?t1 - tile ?t2 - tile ?x - x ?y - y ?x2 -x ?y2 - y)
        :precondition (and
            (estVide ?t2)
            (coordonees ?t1 ?x ?y)
            (coordonees ?t2 ?x2 ?y2)
            (xsame ?x ?x2)
            (yplusone ?y2 ?y))
        :effect (and
            (coordonees ?t2 ?x ?y)
            (coordonees ?t1 ?x2 ?y2)
            (not (coordonees ?t1 ?x ?y))
            (not (coordonees ?t2 ?x2 ?y2))
            )
    )
)
