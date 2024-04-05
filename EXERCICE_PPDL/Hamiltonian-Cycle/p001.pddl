(define (problem hamiltonien) (:domain cycle-hamiltonien)
(:objects 
    A B C D - sommet
    I II III IV V VI VII - arete
)

(:init
    ; exemple du cours
    (connecte A B I)
    (connecte B A I)
    (connecte A B VII)
    (connecte B A VII)
   
    (connecte A D VI)
    (connecte D A VI)
    
    (connecte C B II)
    (connecte B C II)
    (connecte C B III)
    (connecte B C III)
    
    (connecte D B V)
    (connecte B D V)
    
    (connecte D C IV)
    (connecte C D IV)

    
    (nonVisite A)
    (nonVisite B)
    (nonVisite C)
    (nonVisite D)

    
    (nonDemarre)

)

(:goal (and
    (visite A)
    (visite B)
    (visite C)
    (visite D)
    (notestDepart A)
))

)
