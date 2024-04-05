(define (domain sokoban)
    (:requirements :strips :typing)
    (:types case)
    (:predicates
       (empty ?c - case)
       (person ?c - case)
       (wall ?c - case)
       (box ?c - case)
       (goal ?c - case)
       (reach-goal ?c - case)

       (on-left  ?c1 - case ?c2 - case)
       (on-top   ?c1 - case ?c2 - case)
       (on-right ?c1 - case ?c2 - case)
       (on-down  ?c1 - case ?c2 - case)
    )

    (:action MOVE-UP
        :parameters (?c - case ?u - case)
        :precondition (and (on-top ?u ?c) (person ?c) (empty ?u))
        :effect (and (not (person ?c)) (empty ?c) (not (empty ?u)) (person ?u))
        )

    (:action MOVE-DOWN
        :parameters (?c - case ?d - case)
        :precondition (and (on-down ?d ?c) (person ?c) (empty ?d))
        :effect (and (not (person ?c)) (empty ?c) (not (empty ?d)) (person ?d))
        )

    (:action MOVE-LEFT
        :parameters (?c - case ?l - case)
        :precondition (and (on-left ?l ?c) (person ?c) (empty ?l))
        :effect (and (not (person ?c)) (empty ?c) (not (empty ?l)) (person ?l))
        )

    (:action MOVE-RIGHT
        :parameters (?c - case ?r - case)
        :precondition (and (on-right ?r ?c) (person ?c) (empty ?r))
        :effect (and (not (person ?c)) (empty ?c) (not (empty ?r)) (person ?r))
        )

    (:action PUSH-BOX-UP
        :parameters (?p - case ?b - case ?e - case)
        :precondition (and (person ?p) (box ?b) (on-top ?b ?p) (empty ?e) (on-top ?e ?b))
        :effect (and (not (person ?p)) (empty ?p) (not (box ?b)) (person ?b) (not (empty ?e)) (box ?e)
                     (not (reach-goal ?b)))
        )

    (:action PUSH-BOX-DOWN
        :parameters (?p - case ?b - case ?e - case)
        :precondition (and (person ?p) (box ?b) (on-down ?b ?p) (empty ?e) (on-down ?e ?b))
        :effect (and (not (person ?p)) (empty ?p) (not (box ?b)) (person ?b) (not (empty ?e)) (box ?e)
                     (not (reach-goal ?b)))
        )

    (:action PUSH-BOX-LEFT
        :parameters (?p - case ?b - case ?e - case)
        :precondition (and (person ?p) (box ?b) (on-left ?b ?p) (empty ?e) (on-left ?e ?b))
        :effect (and (not (person ?p)) (empty ?p) (not (box ?b)) (person ?b) (not (empty ?e)) (box ?e)
                     (not (reach-goal ?b)))
        )

    (:action PUSH-BOX-RIGHT
        :parameters (?p - case ?b - case ?e - case)
        :precondition (and (person ?p) (box ?b) (on-right ?b ?p) (empty ?e) (on-right ?e ?b))
        :effect (and (not (person ?p)) (empty ?p) (not (box ?b)) (person ?b) (not (empty ?e)) (box ?e)
                     (not (reach-goal ?b)))
        )

    (:action MARQUE-DONE
        :parameters (?c - case)
        :precondition (and (box ?c) (goal ?c))
        :effect (and (reach-goal ?c))
        )
)