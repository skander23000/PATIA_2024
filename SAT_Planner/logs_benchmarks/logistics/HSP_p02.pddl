WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p02.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (140 actions, 56 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

00: (     load-truck obj13 tru1 pos1) [0]
01: (     load-truck obj12 tru1 pos1) [0]
02: (     load-truck obj11 tru1 pos1) [0]
03: (drive-truck tru1 pos1 apt1 cit1) [0]
04: (   unload-truck obj11 tru1 apt1) [0]
05: (    fly-airplane apn1 apt2 apt1) [0]
06: (   unload-truck obj12 tru1 apt1) [0]
07: (  load-airplane obj12 apn1 apt1) [0]
08: (     load-truck obj21 tru2 pos2) [0]
09: (  load-airplane obj11 apn1 apt1) [0]
10: (    fly-airplane apn1 apt1 apt2) [0]
11: (   unload-truck obj13 tru1 apt1) [0]
12: (drive-truck tru2 pos2 apt2 cit2) [0]
13: (   unload-truck obj21 tru2 apt2) [0]
14: (unload-airplane obj11 apn1 apt2) [0]
15: (     load-truck obj11 tru2 apt2) [0]
16: (unload-airplane obj12 apn1 apt2) [0]
17: (drive-truck tru2 apt2 pos2 cit2) [0]
18: (   unload-truck obj11 tru2 pos2) [0]

time spent:       0,03 seconds parsing 
                  0,06 seconds encoding 
                  0,17 seconds searching
                  0,26 seconds total time

memory used:      0,43 MBytes for problem representation
                  0,29 MBytes for searching
                  0,72 MBytes total


