WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p011.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (112 actions, 71 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

00: (unstack c d) [0]
01: (  stack c a) [0]
02: (unstack d b) [0]
03: ( put-down d) [0]
04: (unstack c a) [0]
05: (  stack c d) [0]
06: (unstack a g) [0]
07: ( put-down a) [0]
08: (  pick-up g) [0]
09: (  stack g c) [0]
10: (unstack b e) [0]
11: (  stack b a) [0]
12: (unstack e f) [0]
13: ( put-down e) [0]
14: (  pick-up f) [0]
15: (  stack f g) [0]
16: (unstack b a) [0]
17: (  stack b f) [0]
18: (  pick-up e) [0]
19: (  stack e b) [0]
20: (  pick-up a) [0]
21: (  stack a e) [0]

time spent:       0,03 seconds parsing 
                  0,05 seconds encoding 
                  0,27 seconds searching
                  0,34 seconds total time

memory used:      0,45 MBytes for problem representation
                  1,04 MBytes for searching
                  1,50 MBytes total


