(define (problem sokoban-1)
(:domain sokoban)
(:objects
 c00 - case
 c01 - case
 c02 - case
 c03 - case
 c04 - case
 c10 - case
 c11 - case
 c12 - case
 c13 - case
 c14 - case
 c20 - case
 c21 - case
 c22 - case
 c23 - case
 c24 - case)

(:init (on-left c00 c01) (on-left c01 c02) (on-left c02 c03) (on-left c03 c04)
       (on-left c10 c11) (on-left c11 c12) (on-left c12 c13) (on-left c13 c14)
       (on-left c20 c21) (on-left c21 c22) (on-left c22 c23) (on-left c23 c24)
       (on-right c01 c00) (on-right c02 c01) (on-right c03 c02) (on-right c04 c03)
       (on-right c11 c10) (on-right c12 c11) (on-right c13 c12) (on-right c14 c13)
       (on-right c21 c20) (on-right c22 c21) (on-right c23 c22) (on-right c24 c23)
       (on-top c00 c10) (on-top c01 c11) (on-top c02 c12) (on-top c03 c13) (on-top c04 c14)
       (on-top c10 c20) (on-top c11 c21) (on-top c12 c22) (on-top c13 c23) (on-top c14 c24)
       (on-down c10 c00) (on-down c11 c01) (on-down c12 c02) (on-down c13 c03) (on-down c14 c04)
       (on-down c20 c10) (on-down c21 c11) (on-down c22 c12) (on-down c23 c13) (on-down c24 c14)
       (wall c00) (wall c01) (wall c02) (wall c03) (wall c04)
       (wall c10) (empty c11) (empty c12) (empty c13) (wall c14)
       (wall c20) (wall c21) (wall c22) (wall c23) (wall c24)
       (person c11) (box c12) (goal c13))

(:goal (and (reach-goal c13)))
)