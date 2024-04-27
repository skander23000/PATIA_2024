(define (domain hanoi)
    (:requirements :strips :typing)
    (:types disk)  ; Définit un seul type : 'disk' pour les disques.

    (:predicates
        (on ?x - disk ?y - disk)  ; Indique que le disque ?x est empilé sur le disque ?y.
        (onrod1 ?x - disk)  ; Indique que le disque ?x est sur la tige 1.
        (onrod2 ?x - disk)  ; Indique que le disque ?x est sur la tige 2.
        (onrod3 ?x - disk)  ; Indique que le disque ?x est sur la tige 3.
        (clear ?x - disk)  ; Le disque ?x n'a aucun autre disque posé dessus.
        (handempty)  ; Aucun disque n'est tenu dans la main.
        (holding ?x - disk)  ; La main tient le disque ?x.
        (biggerThan ?x - disk ?y - disk)  ; Le disque ?x est plus grand que le disque ?y.
    )

;EXPLICATION DES ACTIONS :
;pick-up-rodX : Ces actions permettent de prendre un disque d'une des trois tiges, en vérifiant que le disque est le disque supérieur (claire), que la main est vide, et que le disque se trouve sur la tige spécifiée.
;stack : Cette action est utilisée pour placer un disque que l'on tient sur un autre disque, en respectant les règles de taille pour ne pas placer un disque plus grand sur un disque plus petit.
;put-on-rod1 : Cette action place un disque tenu sur la tige 1. Cela implique de libérer la main et de mettre à jour l'état de clarté du disque.s
;unstack : Permet de retirer un disque d'un autre disque, en le plaçant dans la main, ce qui rend le disque inférieur à nouveau libre (clear).

    (:action pick-up-rod1  ; Action pour prendre un disque sur la tige 1.
        :parameters (?x - disk)
        :precondition (and (clear ?x) (handempty) (onrod1 ?x))  ; Le disque doit être libre, la main vide, et le disque sur la tige 1.
        :effect (and
            (not (clear ?x))
            (not (handempty))
            (holding ?x))
    )

    (:action pick-up-rod2  ; Similaire à pick-up-rod1 mais pour la tige 2.
        :parameters (?x - disk)
        :precondition (and (clear ?x) (handempty) (onrod2 ?x))
        :effect (and
            (not (clear ?x))
            (not (handempty))
            (holding ?x))
    )

    (:action pick-up-rod3  ; Similaire à pick-up-rod1 mais pour la tige 3.
        :parameters (?x - disk)
        :precondition (and (clear ?x) (handempty) (onrod3 ?x))
        :effect (and
            (not (clear ?x))
            (not (handempty))
            (holding ?x))
    )

    (:action stack  ; Action pour empiler un disque sur un autre.
        :parameters (?x - disk ?y - disk)
        :precondition (and (holding ?x) (clear ?y) (biggerThan ?y ?x))  ; Tenir un disque, le disque cible doit être libre et plus grand.
        :effect (and
            (not (holding ?x))
            (not (clear ?y))
            (clear ?x)
            (handempty)
            (on ?x ?y))
    )

    (:action put-on-rod1  ; Action pour placer un disque sur la tige 1.
        :parameters (?x - disk)
        :precondition (and (holding ?x))  ; La main doit tenir un disque.
        :effect (and
            (not (holding ?x))
            (clear ?x)
            (handempty)
            (onrod1 ?x))
    )
    
    (:action put-on-rod2  ; Action pour placer un disque sur la tige 2.
        :parameters (?x - disk)
        :precondition (and (holding ?x))  ; La main doit tenir un disque.
        :effect (and
            (not (holding ?x))
            (clear ?x)
            (handempty)
            (onrod2 ?x))
    )
    
    (:action put-on-rod3  ; Action pour placer un disque sur la tige 3.
        :parameters (?x - disk)
        :precondition (and (holding ?x))  ; La main doit tenir un disque.
        :effect (and
            (not (holding ?x))
            (clear ?x)
            (handempty)
            (onrod3 ?x))
    )

    (:action unstack  ; Action pour retirer un disque d'un autre.
        :parameters (?x - disk ?y - disk)
        :precondition (and (on ?x ?y) (clear ?x) (handempty))  ; Le disque ?x doit être sur ?y, libre, et la main vide.
        :effect (and
            (holding ?x)
            (clear ?y)
            (not (clear ?x))
            (not (handempty))
            (not (on ?x ?y)))
    )
)
