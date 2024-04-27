(define (problem coloration-02)
(:domain Coloration)
(:objects
 a - node
 b - node
 c - node
 red - color
 blue - color
 green - color)

(:init
    (no-color a)
    (no-color b)
    (no-color c)
    (arc a b)
    (arc b a)
    (arc a c)
    (arc c a)
    (arc b c)
    (arc c b)
    (is-diff red blue)
    (is-diff blue red)
    (is-diff red green)
    (is-diff green red)
    (is-diff blue green)
    (is-diff green blue))

(:goal (and (arc-done a b) (arc-done a c) (arc-done b c)))

)
