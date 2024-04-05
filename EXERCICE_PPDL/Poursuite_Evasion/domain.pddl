(define (domain PoursuiteEvasion2)

    (:requirements :strips :typing)
    (:types 
        noeud poursuivant
    )

    (:predicates 
        (sur ?n - noeud ?p - poursuivant)
        (couvert ?n - noeud)
        (connecte ?n1 - noeud ?n2 - noeud)
        (uneConnexion ?n1 - noeud)
        (deuxConnexions ?n1 - noeud)
        (nConnexions ?n1 - noeud)
        (pasDeConnexion ?n1 - noeud)
        (pasMemePoursuivant ?p1 - poursuivant ?p2 - poursuivant)
        (pasMemeNoeud ?n1 - noeud ?n2 - noeud)
    )

    
    (:action CouvrirNoeudAvec_Une_Connexion
        :parameters (?n1 - noeud ?n2 - noeud ?p - poursuivant)
        :precondition (and 
                (sur ?n1 ?p)
                (connecte ?n1 ?n2)
                (uneConnexion ?n1)
                )
        :effect (and 
                (not (sur ?n1 ?p))
                (sur ?n2 ?p)
                (couvert ?n2)
                )
    )


    (:action CouvrirNoeudAvec_Deux_Connexion
        :parameters (?n1 - noeud ?n2 - noeud ?n3 - noeud ?p - poursuivant)
        :precondition (and 
                (sur ?n1 ?p)
                (connecte ?n1 ?n2)
                (connecte ?n2 ?n3)
                (pasMemeNoeud ?n2 ?n3)
                (deuxConnexions ?n1)
                (couvert ?n3)
                )
        :effect (and 
                (not (sur ?n1 ?p))
                (sur ?n2 ?p)
                (couvert ?n2)
                )
    )
    
   
    (:action CouvrirNoeudAvec_N_Connexion
        :parameters (?n1 - noeud ?n2 - noeud ?p1 - poursuivant ?p2 - poursuivant)
        :precondition (and 
                (sur ?n1 ?p1)
                (sur ?n1 ?p2)
                (pasMemePoursuivant ?p1 ?p2)
                (connecte ?n1 ?n2)
                (nConnexions ?n1)
                )
        :effect (and 
                (not (sur ?n1 ?p1))
                (sur ?n2 ?p1)
                (couvert ?n2)
                )
    )
    (:action DeplacerEtDecouvrir
        :parameters (?n1 - noeud ?n2 - noeud ?p - poursuivant)
        :precondition (and 
                (sur ?n1 ?p)
                (connecte ?n1 ?n2)
                (pasDeConnexion ?n1) 
                )
        :effect (and 
                (not (sur ?n1 ?p))
                (not (couvert ?n1)) 
                (sur ?n2 ?p)
                (couvert ?n2)
                )
    )

)
