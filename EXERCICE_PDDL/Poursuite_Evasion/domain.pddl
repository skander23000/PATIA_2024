(define (domain PoursuiteEvasion2)
    (:requirements :strips :typing)  ; Utilise les fonctionnalités STRIPS pour la planification et le typage pour les variables.
    (:types
        noeud poursuivant  ; Définit deux types : 'noeud' pour les positions et 'poursuivant' pour les agents.
    )

    (:predicates
        (sur ?n - noeud ?p - poursuivant)  ; Indique qu'un poursuivant est sur un nœud.
        (couvert ?n - noeud)  ; Signifie que le nœud est couvert par un poursuivant.
        (connecte ?n1 - noeud ?n2 - noeud)  ; Exprime une connexion directe entre deux nœuds.
        (uneConnexion ?n1 - noeud)  ; Indique que le nœud a exactement une connexion.
        (deuxConnexions ?n1 - noeud)  ; Indique que le nœud a exactement deux connexions.
        (nConnexions ?n1 - noeud)  ; Signale un nombre indéterminé de connexions pour le nœud.
        (pasDeConnexion ?n1 - noeud)  ; Indique qu'un nœud n'a aucune connexion.
        (pasMemePoursuivant ?p1 - poursuivant ?p2 - poursuivant)  ; Vérifie que deux poursuivants ne sont pas identiques.
        (pasMemeNoeud ?n1 - noeud ?n2 - noeud)  ; Assure que deux nœuds ne sont pas les mêmes.
    )


;EXPLICATION DES ACTIONS :
;CouvrirNoeudAvec_Une_Connexion : Cette action permet à un poursuivant de se déplacer d'un nœud à un autre qui est connecté uniquement à ce nœud source. Cela est utile pour maximiser la couverture dans des configurations de réseau simples.
;CouvrirNoeudAvec_Deux_Connexion : Un poursuivant se déplace d'un nœud à un autre où le nœud intermédiaire est déjà couvert, permettant ainsi d'assurer une couverture continue tout en se déplaçant stratégiquement à travers le réseau.
;CouvrirNoeudAvec_N_Connexion : Permet à un poursuivant de se déplacer tout en laissant un autre poursuivant sur le nœud de départ, utilisé dans des situations où plusieurs options de couverture sont possibles.
;DeplacerEtDecouvrir : Déplace un poursuivant à un autre nœud sans aucune autre connexion, découvrant potentiellement de nouvelles zones non couvertes.



    (:action CouvrirNoeudAvec_Une_Connexion  ; Action pour déplacer un poursuivant vers un nœud connecté unique.
        :parameters (?n1 - noeud ?n2 - noeud ?p - poursuivant)
        :precondition (and
            (sur ?n1 ?p)  ; Le poursuivant doit être sur le nœud n1.
            (connecte ?n1 ?n2)  ; n1 et n2 doivent être connectés.
            (uneConnexion ?n1)  ; n1 doit avoir exactement une connexion.
        )
        :effect (and
            (not (sur ?n1 ?p))  ; Le poursuivant quitte n1.
            (sur ?n2 ?p)  ; Le poursuivant se déplace vers n2.
            (couvert ?n2)  ; n2 est maintenant couvert.
        )
    )

    (:action CouvrirNoeudAvec_Deux_Connexion  ; Déplacer un poursuivant vers un nœud avec exactement deux connexions.
        :parameters (?n1 - noeud ?n2 - noeud ?n3 - noeud ?p - poursuivant)
        :precondition (and
            (sur ?n1 ?p)
            (connecte ?n1 ?n2)
            (connecte ?n2 ?n3)
            (pasMemeNoeud ?n2 ?n3)  ; Assure que n2 et n3 ne sont pas identiques.
            (deuxConnexions ?n1)  ; n1 a deux connexions.
            (couvert ?n3)  ; n3 doit déjà être couvert.
        )
        :effect (and
            (not (sur ?n1 ?p))
            (sur ?n2 ?p)
            (couvert ?n2)
        )
    )

    (:action CouvrirNoeudAvec_N_Connexion  ; Couvrir un nœud depuis un autre avec un nombre indéterminé de connexions.
        :parameters (?n1 - noeud ?n2 - noeud ?p1 - poursuivant ?p2 - poursuivant)
        :precondition (and
            (sur ?n1 ?p1)
            (sur ?n1 ?p2)
            (pasMemePoursuivant ?p1 ?p2)  ; Les deux poursuivants sur n1 doivent être différents.
            (connecte ?n1 ?n2)
            (nConnexions ?n1)
        )
        :effect (and
            (not (sur ?n1 ?p1))
            (sur ?n2 ?p1)
            (couvert ?n2)
        )
    )

    (:action DeplacerEtDecouvrir  ; Déplacer un poursuivant et découvrir de nouveaux nœuds.
        :parameters (?n1 - noeud ?n2 - noeud ?p - poursuivant)
        :precondition (and
            (sur ?n1 ?p)
            (connecte ?n1 ?n2)
            (pasDeConnexion ?n1)  ; n1 ne doit avoir aucune connexion autre que n2.
        )
        :effect (and
            (not (sur ?n1 ?p))
            (not (couvert ?n1))  ; n1 n'est plus couvert après le départ du poursuivant.
            (sur ?n2 ?p)
            (couvert ?n2)
        )
    )

)
