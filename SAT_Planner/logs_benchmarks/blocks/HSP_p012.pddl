WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p012.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (112 actions, 71 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

00: (unstack b c) [0]
01: ( put-down b) [0]
02: (unstack c g) [0]
03: (  stack c a) [0]
04: (unstack g e) [0]
05: ( put-down g) [0]
06: (unstack c a) [0]
07: (  stack c g) [0]
08: (unstack a d) [0]
09: (  stack a c) [0]
10: (  pick-up d) [0]
11: (  stack d a) [0]
12: (unstack e f) [0]
13: ( put-down e) [0]
14: (  pick-up f) [0]
15: (  stack f d) [0]
16: (  pick-up b) [0]
17: (  stack b f) [0]
18: (  pick-up e) [0]
19: (  stack e b) [0]

time spent:       0,02 seconds parsing 
                  0,05 seconds encoding 
                  0,11 seconds searching
                  0,18 seconds total time

memory used:      0,45 MBytes for problem representation
                  0,29 MBytes for searching
                  0,75 MBytes total


