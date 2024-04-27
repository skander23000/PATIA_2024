WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/logistics-round1/domain.pddl
pbmFile :../src/test/resources/benchmarks/logistics-round1/p02.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p02.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (140 actions, 56 fluents)

Temps de recherche : 5.691

found plan as follows:

00: (     load-truck obj21 tru2 pos2) [0]
01: (drive-truck tru2 pos2 apt2 cit2) [0]
02: (   unload-truck obj21 tru2 apt2) [0]
03: (     load-truck obj13 tru1 pos1) [0]
04: (     load-truck obj11 tru1 pos1) [0]
05: (     load-truck obj12 tru1 pos1) [0]
06: (drive-truck tru1 pos1 apt1 cit1) [0]
07: (   unload-truck obj11 tru1 apt1) [0]
08: (   unload-truck obj12 tru1 apt1) [0]
09: (   unload-truck obj13 tru1 apt1) [0]
10: (    fly-airplane apn1 apt2 apt1) [0]
11: (  load-airplane obj11 apn1 apt1) [0]
12: (  load-airplane obj12 apn1 apt1) [0]
13: (    fly-airplane apn1 apt1 apt2) [0]
14: (unload-airplane obj11 apn1 apt2) [0]
15: (     load-truck obj11 tru2 apt2) [0]
16: (drive-truck tru2 apt2 pos2 cit2) [0]
17: (unload-airplane obj12 apn1 apt2) [0]
18: (   unload-truck obj11 tru2 pos2) [0]

time spent:       0,04 seconds parsing 
                  0,08 seconds encoding 
                  0,00 seconds searching
                  0,11 seconds total time

memory used:      0,43 MBytes for problem representation
                  0,00 MBytes for searching
                  0,43 MBytes total


