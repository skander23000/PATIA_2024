WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p02.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (52 actions, 38 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

00: (      move rooma roomb) [0]
01: (pick ball5 rooma right) [0]
02: (drop ball5 roomb right) [0]
03: ( pick ball2 rooma left) [0]
04: ( drop ball2 roomb left) [0]
05: (pick ball6 rooma right) [0]
06: (drop ball6 roomb right) [0]
07: ( pick ball4 rooma left) [0]
08: ( drop ball4 roomb left) [0]
09: (pick ball3 rooma right) [0]
10: (drop ball3 roomb right) [0]
11: ( pick ball1 rooma left) [0]
12: ( drop ball1 roomb left) [0]

time spent:       0,03 seconds parsing 
                  0,04 seconds encoding 
                  0,86 seconds searching
                  0,93 seconds total time

memory used:      0,15 MBytes for problem representation
                  7,09 MBytes for searching
                  7,23 MBytes total


