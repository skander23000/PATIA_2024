(define (domain cycle-hamiltonien)
  
  (:requirements :strips :typing)
  (:types sommet arete)
  (:predicates
    (connecte ?de - sommet ?a - sommet ?par - arete)
    (visite ?s - sommet)
    (nonVisite ?s - sommet)
    (estDepart ?s - sommet)
    (notestDepart ?s - sommet)
    (last ?s - sommet)
    
    (nonDemarre) ;permet de ne pas spécifier le noeud de départ
  )

  (:action debuter
    :parameters (?start - sommet)
    :precondition (and 
            (nonDemarre)
            )
    :effect (and 
             (not (nonDemarre))
             (visite ?start)
             (estDepart ?start)
             )
  )

  (:action visiter
    :parameters (?par - arete ?de - sommet ?a - sommet)
    :precondition (and (connecte ?de ?a ?par) (visite ?de) ( nonVisite ?a))
    :effect (and 
             (visite ?a)
             (not (nonVisite ?a))
             (last ?a)
             (not (last ?de))
            )
  )
  
  (:action terminer
  :parameters (?par - arete ?de - sommet ?a - sommet)
  :precondition (and
                 (connecte ?de ?a ?par) ; Assure que les sommets sont connectés
                 (visite ?de) ; Le sommet actuel a été visité
                 (estDepart ?a) ; Le sommet de destination est le sommet de départ
                 (last ?de)
                 )
  :effect (and
           (notestDepart ?a)
          )
)

)
