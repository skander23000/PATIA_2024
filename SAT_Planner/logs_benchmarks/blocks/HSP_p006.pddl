WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p006.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (60 actions, 41 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

00: (unstack d e) [0]
01: ( put-down d) [0]
02: (unstack e c) [0]
03: ( put-down e) [0]
04: (unstack c a) [0]
05: (  stack c d) [0]
06: (unstack a b) [0]
07: ( put-down a) [0]
08: (  pick-up e) [0]
09: (  stack e a) [0]
10: (  pick-up b) [0]
11: (  stack b e) [0]
12: (unstack c d) [0]
13: (  stack c b) [0]
14: (  pick-up d) [0]
15: (  stack d c) [0]

time spent:       0,02 seconds parsing 
                  0,05 seconds encoding 
                  0,02 seconds searching
                  0,09 seconds total time

memory used:      0,26 MBytes for problem representation
                  0,02 MBytes for searching
                  0,28 MBytes total


