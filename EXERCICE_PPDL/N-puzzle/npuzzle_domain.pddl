(define (domain npuzzle)
    (:requirements :strips :typing)

    (:types tile x y)
    (:predicates
        (estVide ?x - tile)
        (biggerThan ?x - tile ?y - tile)
        (coordonees ?t - tile ?x - x ?y - y)
        (xplusone ?x - x ?x2 - x)
        (yplusone ?y - y ?y2 - y)
        (xsame ?x - x ?x2 - x)
        (ysame ?y - y ?y2 - y)
    )

    (:action moveleft
        :parameters (?t1 - tile ?t2 - tile ?x - x ?y - y ?x2 -x ?y2 - y)
        :precondition (and 
            (estVide ?t2) 
            (coordonees ?t1 ?x ?y) 
            (coordonees ?t2 ?x2 ?y2) 
            (ysame ?y ?y2) 
            (xplusone ?x2 ?x))
        :effect (and 
            (coordonees ?t2 ?x ?y)
            (coordonees ?t1 ?x2 ?y2)
            (not (coordonees ?t1 ?x ?y))
            (not (coordonees ?t2 ?x2 ?y2))
            )
    )

    (:action moveright
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

    (:action movedown
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

    (:action moveup
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