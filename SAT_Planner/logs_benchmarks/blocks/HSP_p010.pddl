WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p010.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (112 actions, 71 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

00: (unstack e g) [0]
01: ( put-down e) [0]
02: (unstack g b) [0]
03: ( put-down g) [0]
04: (unstack b a) [0]
05: (  stack b g) [0]
06: (unstack a f) [0]
07: ( put-down a) [0]
08: (unstack f c) [0]
09: (  stack f e) [0]
10: (unstack c d) [0]
11: (  stack c f) [0]
12: (unstack b g) [0]
13: (  stack b c) [0]
14: (  pick-up d) [0]
15: (  stack d b) [0]
16: (  pick-up g) [0]
17: (  stack g d) [0]
18: (  pick-up a) [0]
19: (  stack a g) [0]

time spent:       0,03 seconds parsing 
                  0,05 seconds encoding 
                  0,09 seconds searching
                  0,16 seconds total time

memory used:      0,45 MBytes for problem representation
                  0,19 MBytes for searching
                  0,64 MBytes total


