WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p005.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (60 actions, 41 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

00: (unstack b a) [0]
01: (  stack b c) [0]
02: (unstack a d) [0]
03: (  stack a e) [0]
04: (unstack b c) [0]
05: (  stack b a) [0]
06: (  pick-up c) [0]
07: (  stack c b) [0]
08: (  pick-up d) [0]
09: (  stack d c) [0]

time spent:       0,02 seconds parsing 
                  0,04 seconds encoding 
                  0,01 seconds searching
                  0,07 seconds total time

memory used:      0,26 MBytes for problem representation
                  0,01 MBytes for searching
                  0,27 MBytes total


