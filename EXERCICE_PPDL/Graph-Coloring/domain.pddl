(define (domain Coloration)
    (:requirements :strips :typing)
    (:types node color)
    (:predicates (no-color ?a - node)
        (on-color ?a - node ?c - color)
        (is-diff ?c1 - color ?c2 - color)
        (arc ?a - node ?b - node)
        (arc-done ?a - node ?b - node)
        (single ?a - node)
        (single-done ?a - node)
    )

    (:action COLOR-ARC-BOTH
        :parameters (?a - node ?c1 - color ?b - node ?c2 - color)
        :precondition (and (arc ?a ?b) (no-color ?a) (no-color ?b) (is-diff ?c1 ?c2))
        :effect (and (not (no-color ?a)) (on-color ?a ?c1)
                     (not (no-color ?b)) (on-color ?b ?c2)
                     (arc-done ?a ?b)
                     (arc-done ?b ?a))
        )

    (:action COLOR-ARC-LEFT
        :parameters (?a - node ?c1 - color ?b - node ?c2 - color)
        :precondition (and (arc ?a ?b) (no-color ?a) (on-color ?b ?c2) (is-diff ?c1 ?c2))
        :effect (and (not (no-color ?a)) (on-color ?a ?c1)
                     (arc-done ?a ?b)
                     (arc-done ?b ?a))
        )

    (:action COLOR-ARC-RIGHT
        :parameters (?a - node ?c1 - color ?b - node ?c2 - color)
        :precondition (and (arc ?a ?b) (on-color ?a ?c1) (no-color ?b)  (is-diff ?c1 ?c2))
        :effect (and (not (no-color ?b)) (on-color ?b ?c2)
                     (arc-done ?a ?b)
                     (arc-done ?b ?a))
        )

    (:action MARQUE-ARC-DONE
        :parameters (?a - node ?c1 - color ?b - node ?c2 - color)
        :precondition (and (arc ?a ?b) (on-color ?a ?c1) (on-color ?b ?c2)  (is-diff ?c1 ?c2))
        :effect (and (arc-done ?a ?b)
                     (arc-done ?b ?a))
        )

    (:action COLOR-SINGLE-NODE
        :parameters (?a - node ?c - color)
        :precondition (and (single ?a) (no-color ?a))
        :effect (and (on-color ?a ?c)
                     (single-done ?a))
        )
)
