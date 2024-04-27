(define (domain Coloration)
    (:requirements :strips :typing)
    (:types node color)  ; Définit deux types : 'node' pour les nœuds du graphe et 'color' pour les couleurs.

    (:predicates
        (no-color ?a - node)  ; Indique qu'un nœud n'a pas encore été coloré.
        (on-color ?a - node ?c - color)  ; Marque un nœud avec une couleur spécifique.
        (is-diff ?c1 - color ?c2 - color)  ; Vérifie que deux couleurs sont différentes.
        (arc ?a - node ?b - node)  ; Indique une relation d'adjacence entre deux nœuds.
        (arc-done ?a - node ?b - node)  ; Marque un arc comme traité après coloration.
        (single ?a - node)  ; Identifie un nœud isolé sans voisins connectés.
        (single-done ?a - node)  ; Indique qu'un nœud isolé a été coloré.
    )


;EXPLICATION DES ACTIONS
;COLOR-ARC-BOTH : Cette action est utilisée quand deux nœuds adjacents ne sont pas encore colorés. Elle assigne une couleur différente à chaque nœud pour respecter la règle de coloration.
;COLOR-ARC-LEFT et COLOR-ARC-RIGHT : Ces actions traitent les cas où l'un des nœuds d'un arc est déjà coloré. Elles garantissent que l'autre nœud est coloré d'une couleur différente.
;MARQUE-ARC-DONE : Cette action est utilisée pour marquer un arc comme complètement traité une fois que les deux nœuds sont colorés différemment.
;COLOR-SINGLE-NODE : Colorie un nœud qui n'a pas de voisins connectés. Utile pour les cas où des nœuds isolés existent dans le graphe.


    (:action COLOR-ARC-BOTH  ; Colorie deux nœuds adjacents simultanément avec des couleurs différentes.
        :parameters (?a - node ?c1 - color ?b - node ?c2 - color)
        :precondition (and (arc ?a ?b) (no-color ?a) (no-color ?b) (is-diff ?c1 ?c2))
        :effect (and (not (no-color ?a)) (on-color ?a ?c1)
                     (not (no-color ?b)) (on-color ?b ?c2)
                     (arc-done ?a ?b)
                     (arc-done ?b ?a))
    )

    (:action COLOR-ARC-LEFT  ; Colorie le nœud gauche d'un arc, le nœud droit étant déjà coloré.
        :parameters (?a - node ?c1 - color ?b - node ?c2 - color)
        :precondition (and (arc ?a ?b) (no-color ?a) (on-color ?b ?c2) (is-diff ?c1 ?c2))
        :effect (and (not (no-color ?a)) (on-color ?a ?c1)
                     (arc-done ?a ?b)
                     (arc-done ?b ?a))
    )

    (:action COLOR-ARC-RIGHT  ; Colorie le nœud droit d'un arc, le nœud gauche étant déjà coloré.
        :parameters (?a - node ?c1 - color ?b - node ?c2 - color)
        :precondition (and (arc ?a ?b) (on-color ?a ?c1) (no-color ?b) (is-diff ?c1 ?c2))
        :effect (and (not (no-color ?b)) (on-color ?b ?c2)
                     (arc-done ?a ?b)
                     (arc-done ?b ?a))
    )

    (:action MARQUE-ARC-DONE  ; Marque un arc comme traité une fois que les deux nœuds sont correctement colorés.
        :parameters (?a - node ?c1 - color ?b - node ?c2 - color)
        :precondition (and (arc ?a ?b) (on-color ?a ?c1) (on-color ?b ?c2) (is-diff ?c1 ?c2))
        :effect (and (arc-done ?a ?b)
                     (arc-done ?b ?a))
    )

    (:action COLOR-SINGLE-NODE  ; Colorie un nœud isolé.
        :parameters (?a - node ?c - color)
        :precondition (and (single ?a) (no-color ?a))
        :effect (and (on-color ?a ?c)
                     (single-done ?a))
    )
)
