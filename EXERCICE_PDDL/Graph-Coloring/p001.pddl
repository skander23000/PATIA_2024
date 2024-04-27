(define (problem coloration-04)
(:domain Coloration)
(:objects
 WA - node
 NT - node
 SA - node
 Q - node
 NSW - node
 V - node
 T - node
 blue - color
 purple - color
 yellow - color)

(:init
    (no-color WA)
    (no-color NT)
    (no-color SA)
    (no-color Q)
    (no-color Q)
    (no-color NSW)
    (no-color V)
    (no-color T)
    (arc WA NT)
    (arc WA SA)
    (arc NT WA)
    (arc NT Q)
    (arc NT SA)
    (arc SA WA)
    (arc SA NT)
    (arc SA Q)
    (arc SA NSW)
    (arc SA V)
    (arc Q NT)
    (arc Q SA)
    (arc Q NSW)
    (arc NSW Q)
    (arc NSW SA)
    (arc NSW V)
    (arc V SA)
    (arc V NSW)
    (single T)
    (is-diff blue purple)
    (is-diff purple blue)
    (is-diff purple yellow)
    (is-diff yellow purple)
    (is-diff blue yellow)
    (is-diff yellow blue))

(:goal (and (arc-done WA NT)
            (arc-done WA SA)
            (arc-done NT SA)
            (arc-done NT Q)
            (arc-done SA Q)
            (arc-done SA NSW)
            (arc-done SA V)
            (arc-done Q NSW)
            (arc-done NSW V)
            (single-done T)))

)
