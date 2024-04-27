(define (problem coloration-01)
(:domain Coloration)
(:objects
 a - node
 b - node
 red - color
 blue - color)

(:init
    (no-color a)
    (no-color b)
    (arc a b)
    (arc b a)
    (is-diff red blue)
    (is-diff blue red))

(:goal (and (arc-done a b)))

)
