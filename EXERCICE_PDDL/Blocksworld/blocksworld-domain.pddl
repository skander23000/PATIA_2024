(define (domain blocks)
    (:requirements :strips :typing)
    (:types block)  ; Définit un seul type : 'block' pour les blocs.

    (:predicates
        (on ?x - block ?y - block)  ; Indique que le bloc ?x est empilé sur le bloc ?y.
        (ontable ?x - block)  ; Signifie que le bloc ?x est sur la table.
        (clear ?x - block)  ; Le bloc ?x n'a aucun autre bloc posé dessus.
        (handempty)  ; Aucun bloc n'est tenu dans la main.
        (holding ?x - block)  ; La main tient le bloc ?x.
    )


:EXPLICATION DES ACTIONS :
;pick-up : Cette action est utilisée pour prendre un bloc libre sur la table. Elle change l'état du bloc et de la main.
;put-down : Permet de poser un bloc tenu dans la main sur la table, libérant la main et le bloc.
;stack : Utilisée pour empiler un bloc tenu sur un autre bloc libre. Elle nécessite que la main tienne un bloc et que le bloc cible soit libre.
;unstack : Permet de retirer un bloc du haut d'une pile et de le tenir dans la main. Cette action inverse l'action de "stack".


    (:action pick-up  ; Action pour prendre un bloc sur la table.
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (handempty))  ; Le bloc doit être sur la table, libre, et la main vide.
        :effect (and
            (not (ontable ?x))  ; Le bloc n'est plus sur la table.
            (not (clear ?x))  ; Le bloc n'est plus libre.
            (not (handempty))  ; La main n'est plus vide.
            (holding ?x))  ; La main tient maintenant le bloc.
    )

    (:action put-down  ; Action pour poser un bloc sur la table.
        :parameters (?x - block)
        :precondition (holding ?x)  ; La main doit tenir un bloc.
        :effect (and
            (not (holding ?x))  ; La main ne tient plus le bloc.
            (clear ?x)  ; Le bloc est maintenant libre.
            (handempty)  ; La main est vide.
            (ontable ?x))  ; Le bloc est remis sur la table.
    )

    (:action stack  ; Action pour empiler un bloc sur un autre bloc.
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))  ; La main doit tenir un bloc et le bloc cible doit être libre.
        :effect (and
            (not (holding ?x))  ; La main ne tient plus le bloc.
            (not (clear ?y))  ; Le bloc cible n'est plus libre.
            (clear ?x)  ; Le bloc tenu devient le bloc supérieur libre.
            (handempty)  ; La main est vide.
            (on ?x ?y))  ; Le bloc est empilé sur le bloc cible.
    )

    (:action unstack  ; Action pour dépiler un bloc d'un autre bloc.
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (handempty))  ; Le bloc doit être empilé sur un autre et libre, et la main vide.
        :effect (and
            (holding ?x)  ; La main tient le bloc.
            (clear ?y)  ; Le bloc inférieur devient libre.
            (not (clear ?x))  ; Le bloc n'est plus libre.
            (not (handempty))  ; La main n'est plus vide.
            (not (on ?x ?y)))  ; Le bloc n'est plus empilé sur l'autre.
    )
)
