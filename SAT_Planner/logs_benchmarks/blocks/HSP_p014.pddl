WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p014.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (144 actions, 89 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

00: (unstack e c) [0]
01: ( put-down e) [0]
02: (unstack h a) [0]
03: ( put-down h) [0]
04: (unstack a b) [0]
05: (  stack a e) [0]
06: (  pick-up h) [0]
07: (  stack h a) [0]
08: (  pick-up f) [0]
09: (  stack f h) [0]
10: (unstack b g) [0]
11: (  stack b d) [0]
12: (  pick-up g) [0]
13: (  stack g f) [0]
14: (unstack b d) [0]
15: (  stack b g) [0]
16: (  pick-up d) [0]
17: (  stack d b) [0]
18: (  pick-up c) [0]
19: (  stack c d) [0]

time spent:       0,04 seconds parsing 
                  0,06 seconds encoding 
                  0,27 seconds searching
                  0,37 seconds total time

memory used:      0,57 MBytes for problem representation
                  0,80 MBytes for searching
                  1,37 MBytes total


