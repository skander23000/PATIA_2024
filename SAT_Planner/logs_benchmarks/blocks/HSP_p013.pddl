WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p013.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (144 actions, 89 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

00: (unstack a g) [0]
01: ( put-down a) [0]
02: (unstack g e) [0]
03: (  stack g b) [0]
04: (  pick-up a) [0]
05: (  stack a g) [0]
06: (  pick-up c) [0]
07: (  stack c a) [0]
08: (unstack d h) [0]
09: ( put-down d) [0]
10: (unstack h f) [0]
11: (  stack h c) [0]
12: (  pick-up e) [0]
13: (  stack e h) [0]
14: (  pick-up f) [0]
15: (  stack f e) [0]
16: (  pick-up d) [0]
17: (  stack d f) [0]

time spent:       0,03 seconds parsing 
                  0,06 seconds encoding 
                  0,13 seconds searching
                  0,22 seconds total time

memory used:      0,57 MBytes for problem representation
                  0,24 MBytes for searching
                  0,82 MBytes total


