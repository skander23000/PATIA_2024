WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/logistics-round1/domain.pddl
pbmFile :../src/test/resources/benchmarks/logistics-round1/p03.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p03.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (140 actions, 56 fluents)

Temps de recherche : 0.87

found plan as follows:

00: (     load-truck obj11 tru1 pos1) [0]
01: (drive-truck tru1 pos1 apt1 cit1) [0]
02: (   unload-truck obj11 tru1 apt1) [0]
03: (  load-airplane obj11 apn1 apt1) [0]
04: (    fly-airplane apn1 apt1 apt2) [0]
05: (     load-truck obj21 tru2 pos2) [0]
06: (drive-truck tru2 pos2 apt2 cit2) [0]
07: (   unload-truck obj21 tru2 apt2) [0]
08: (unload-airplane obj11 apn1 apt2) [0]
09: (  load-airplane obj21 apn1 apt2) [0]
10: (    fly-airplane apn1 apt2 apt1) [0]
11: (     load-truck obj11 tru2 apt2) [0]
12: (drive-truck tru2 apt2 pos2 cit2) [0]
13: (unload-airplane obj21 apn1 apt1) [0]
14: (   unload-truck obj11 tru2 pos2) [0]

time spent:       0,04 seconds parsing 
                  0,07 seconds encoding 
                  0,00 seconds searching
                  0,11 seconds total time

memory used:      0,43 MBytes for problem representation
                  0,00 MBytes for searching
                  0,43 MBytes total


