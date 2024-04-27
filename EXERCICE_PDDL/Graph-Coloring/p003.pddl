(define (problem coloration-03)
(:domain Coloration)
(:objects
 a - node
 b - node
 c - node
 d - node
 red - color
 blue - color
 green - color)

(:init
    (no-color a)
    (no-color b)
    (no-color c)
    (no-color d)
    (arc a b)
    (arc b a)
    (arc b c)
    (arc c b)
    (arc c d)
    (arc d c)
    (arc a d)
    (arc d a)
    (arc a c)
    (arc c a)
    (is-diff red blue)
    (is-diff blue red)
    (is-diff red green)
    (is-diff green red)
    (is-diff blue green)
    (is-diff green blue))

(:goal (and (arc-done a b)
            (arc-done b c)
            (arc-done c d)
            (arc-done a d)
            (arc-done a c)))

)
