WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p015.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (144 actions, 89 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

00: (unstack d b) [0]
01: (  stack d h) [0]
02: (  pick-up a) [0]
03: (  stack a d) [0]
04: (unstack b f) [0]
05: ( put-down b) [0]
06: (unstack f g) [0]
07: (  stack f a) [0]
08: (  pick-up g) [0]
09: (  stack g f) [0]
10: (  pick-up e) [0]
11: (  stack e g) [0]
12: (  pick-up b) [0]
13: (  stack b e) [0]
14: (  pick-up c) [0]
15: (  stack c b) [0]

time spent:       0,02 seconds parsing 
                  0,06 seconds encoding 
                  0,13 seconds searching
                  0,21 seconds total time

memory used:      0,57 MBytes for problem representation
                  0,23 MBytes for searching
                  0,80 MBytes total


