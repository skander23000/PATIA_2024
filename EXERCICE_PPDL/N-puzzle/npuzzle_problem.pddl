(define (problem npuzzle-a)
(:domain npuzzle)

(:objects
    t1 t2 t3 tvide - tile
    x0 x1 - x
    y0 y1 - y
)
(:init
(biggerThan t3 t2)
(biggerThan t3 t1)
(biggerThan t2 t1)
(estVide tvide)
(coordonees tvide x0 y0)
(coordonees t3 x1 y0)
(coordonees t2 x0 y1)
(coordonees t1 x1 y1)
(xplusone x0 x1)
(yplusone y0 y1)
(xsame x0 x0)
(xsame x1 x1)
(ysame y0 y0)
(ysame y1 y1)
)
(:goal (and
    (coordonees t1 x0 y0)
    (coordonees t2 x1 y0)
    (coordonees t3 x0 y1)
    (coordonees tvide x1 y1)
))

)