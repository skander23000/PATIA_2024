WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p001.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (40 actions, 29 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

0: (pick-up b) [0]
1: (stack b a) [0]
2: (pick-up c) [0]
3: (stack c b) [0]
4: (pick-up d) [0]
5: (stack d c) [0]

time spent:       0,03 seconds parsing 
                  0,03 seconds encoding 
                  0,01 seconds searching
                  0,07 seconds total time

memory used:      0,19 MBytes for problem representation
                  0,00 MBytes for searching
                  0,19 MBytes total


