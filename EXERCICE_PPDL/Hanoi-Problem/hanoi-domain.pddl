
(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk)
  (:predicates 
        (on ?x - disk ?y - disk)
        (onrod1 ?x - disk)
        (onrod2 ?x - disk)
        (onrod3 ?x - disk)
        (clear ?x - disk)
        (handempty)
        (holding ?x - disk)
        (biggerThan ?x - disk ?y - disk)
        
	)

  (:action pick-up-rod1
	     :parameters (?x - disk)
	     :precondition (and (clear ?x) (handempty) (onrod1 ?x))
	     :effect
	     (and 
		   (not (clear ?x))
		   (not (handempty))
		   (holding ?x))
           
           )
    
    (:action pick-up-rod2
	     :parameters (?x - disk)
	     :precondition (and (clear ?x) (handempty) (onrod2 ?x))
	     :effect
	     (and 
		   (not (clear ?x))
		   (not (handempty))
		   (holding ?x))
           
           )

    (:action pick-up-rod3
	     :parameters (?x - disk)
	     :precondition (and (clear ?x) (handempty) (onrod3 ?x))
	     :effect
	     (and 
		   (not (clear ?x))
		   (not (handempty))
		   (holding ?x))
           )


    (:action stack
	     :parameters (?x - disk ?y - disk)
	     :precondition (and (holding ?x) (clear ?y)(biggerThan ?y ?x))
	     :effect
	     (and (not (holding ?x))
		   (not (clear ?y))
		   (clear ?x)
		   (handempty)
		   (on ?x ?y)))

    (:action put-on-rod1
        :parameters (?x - disk)
         :precondition (and (holding ?x) ())
        :effect
	     (and (not (holding ?x))
		   (clear ?x)
		   (handempty)
		)
    
    )


  (:action unstack
	     :parameters (?x - disk ?y - disk)
	     :precondition (and (on ?x ?y) (clear ?x) (handempty))
	     :effect
	     (and (holding ?x)
		   (clear ?y)
		   (not (clear ?x))
		   (not (handempty))
		   (not (on ?x ?y))
        )
    )


)