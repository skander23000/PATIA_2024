WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/logistics-round1/domain.pddl
pbmFile :../src/test/resources/benchmarks/logistics-round1/p01.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p01.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (140 actions, 56 fluents)

Temps de recherche : 4.556

found plan as follows:

00: (     load-truck obj21 tru2 pos2) [0]
01: (     load-truck obj23 tru2 pos2) [0]
02: (drive-truck tru2 pos2 apt2 cit2) [0]
03: (   unload-truck obj21 tru2 apt2) [0]
04: (   unload-truck obj23 tru2 apt2) [0]
05: (  load-airplane obj21 apn1 apt2) [0]
06: (  load-airplane obj23 apn1 apt2) [0]
07: (    fly-airplane apn1 apt2 apt1) [0]
08: (unload-airplane obj23 apn1 apt1) [0]
09: (     load-truck obj13 tru1 pos1) [0]
10: (     load-truck obj11 tru1 pos1) [0]
11: (drive-truck tru1 pos1 apt1 cit1) [0]
12: (   unload-truck obj13 tru1 apt1) [0]
13: (unload-airplane obj21 apn1 apt1) [0]
14: (     load-truck obj23 tru1 apt1) [0]
15: (     load-truck obj21 tru1 apt1) [0]
16: (   unload-truck obj11 tru1 apt1) [0]
17: (drive-truck tru1 apt1 pos1 cit1) [0]
18: (   unload-truck obj23 tru1 pos1) [0]
19: (   unload-truck obj21 tru1 pos1) [0]

time spent:       0,03 seconds parsing 
                  0,06 seconds encoding 
                  0,00 seconds searching
                  0,09 seconds total time

memory used:      0,43 MBytes for problem representation
                  0,00 MBytes for searching
                  0,43 MBytes total


