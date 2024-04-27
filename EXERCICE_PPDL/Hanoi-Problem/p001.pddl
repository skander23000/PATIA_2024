(define (problem hanoi-1)
(:domain hanoi)
(:objects d b a c - disk)
(:init 
(clear c) 
(clear a) 
(clear b) 
(clear d) 
(onrod1 a) 
(onrod1 b)
(onrod1 c)
(onrod1 d)
(biggerThan a b)
(biggerThan a c)
(biggerThan a d)
(biggerThan b c)
(biggerThan b d)
(biggerThan c d)
(on b a)
(on c b)
(on d c)
(handempty))


(:goal 
    (and
        (onrod3 a) 
        (onrod3 b)
        (onrod3 c)
        (onrod3 d)
    )
)

)