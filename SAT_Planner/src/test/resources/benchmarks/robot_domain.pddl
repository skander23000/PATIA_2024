(define (domain robot)
    (:requirements :strips :typing)

    (:types robot room)
    (:predicates
        (at ?x - robot ?y - room)
    )

    (:action MOVE
        :parameters (?x - robot ?y1 - room ?y2 - room)
        :precondition (and
            (at ?x ?y1))
        :effect (and 
            (at ?x ?y2)
            (not (at ?x ?y1))
        )
    )
)