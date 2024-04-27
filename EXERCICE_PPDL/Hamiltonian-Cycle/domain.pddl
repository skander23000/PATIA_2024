(define (domain cycle-hamiltonien)
    (:requirements :strips :typing)
    (:types sommet arete)  ; Définit deux types : 'sommet' pour les nœuds du graphe et 'arete' pour les liens entre eux.

    (:predicates
        (connecte ?de - sommet ?a - sommet ?par - arete)  ; Indique une connexion entre deux sommets via une arête.
        (visite ?s - sommet)  ; Marque un sommet comme visité.
        (nonVisite ?s - sommet)  ; Marque un sommet comme non visité.
        (estDepart ?s - sommet)  ; Identifie le sommet de départ pour le cycle.
        (notestDepart ?s - sommet)  ; Utilisé pour indiquer que le sommet n'est plus le sommet de départ à la fin du cycle.
        (last ?s - sommet)  ; Marque le dernier sommet visité.
        (nonDemarre)  ; Indique que le parcours n'a pas encore commencé.
    )

    (:action debuter  ; Action pour commencer le parcours à un sommet spécifié.
        :parameters (?start - sommet)
        :precondition (and
            (nonDemarre)  ; Le parcours ne doit pas avoir commencé.
        )
        :effect (and
            (not (nonDemarre))  ; Le parcours commence.
            (visite ?start)  ; Marque le sommet de départ comme visité.
            (estDepart ?start)  ; Définit le sommet de départ.
        )
    )

    (:action visiter  ; Action pour visiter un nouveau sommet à partir du dernier sommet visité.
        :parameters (?par - arete ?de - sommet ?a - sommet)
        :precondition (and
            (connecte ?de ?a ?par)  ; Les deux sommets doivent être connectés par une arête.
            (visite ?de)  ; Le sommet de départ doit avoir été visité.
            (nonVisite ?a)  ; Le sommet à visiter ne doit pas avoir été visité auparavant.
        )
        :effect (and
            (visite ?a)  ; Marque le sommet comme visité.
            (not (nonVisite ?a))  ; Enlève le marqueur de non visité.
            (last ?a)  ; Définit ce sommet comme le dernier visité.
            (not (last ?de))  ; Enlève le marqueur de dernier sommet du précédent.
        )
    )

    (:action terminer  ; Action pour terminer le cycle en revenant au sommet de départ.
        :parameters (?par - arete ?de - sommet ?a - sommet)
        :precondition (and
            (connecte ?de ?a ?par)  ; Les sommets doivent être connectés.
            (visite ?de)  ; Le sommet actuel doit avoir été visité.
            (estDepart ?a)  ; Le sommet de destination est le sommet de départ.
            (last ?de)  ; Le sommet actuel est le dernier visité.
        )
        :effect (and
            (notestDepart ?a)  ; Indique que le sommet de départ n'est plus considéré comme tel.
        )
    )
)
