(define (problem pours-0-2) (:domain PoursuiteEvasion2)
    (:objects
        n1 n2 n3 n4 n5 - noeud
        p1 p2 - poursuivant
    )

    (:init
        ;Exercice donnée dans le cours 
        
        ;connexion
        (connecte n1 n2)
        (connecte n2 n1)
        (connecte n2 n4)
        (connecte n4 n2)
        (connecte n2 n3)
        (connecte n3 n2)
        (connecte n2 n5)
        (connecte n5 n2)
        (connecte n3 n4)
        (connecte n4 n3)
        
        ;nombre de connexion
        (uneConnexion n1)
        (nConnexions n2)
        (deuxConnexions n3)
        (deuxConnexions n4)
        (uneConnexion n5)


        (pasMemeNoeud n1 n2)
        (pasMemeNoeud n2 n1)
        (pasMemeNoeud n1 n3)
        (pasMemeNoeud n3 n1)
        (pasMemeNoeud n1 n4)
        (pasMemeNoeud n4 n1)
        (pasMemeNoeud n1 n5)
        (pasMemeNoeud n5 n1)
        (pasMemeNoeud n2 n3)
        (pasMemeNoeud n3 n2)
        (pasMemeNoeud n2 n4)
        (pasMemeNoeud n4 n2)
        (pasMemeNoeud n2 n5)
        (pasMemeNoeud n5 n2)
        (pasMemeNoeud n3 n4)
        (pasMemeNoeud n4 n3)
        (pasMemeNoeud n3 n5)
        (pasMemeNoeud n5 n3)
        (pasMemeNoeud n4 n5)
        (pasMemeNoeud n5 n4)

        
        
        (pasMemePoursuivant p1 p2)
        (pasMemePoursuivant p2 p1)

        (sur n1 p1)
        (sur n1 p2)
        (couvert n1)
    )

    (:goal
        (and
            (couvert n1)
            (couvert n2)
            (couvert n3)
            (couvert n4)
            (couvert n5)
        )
    )
)
