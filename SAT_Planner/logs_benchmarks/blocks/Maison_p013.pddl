WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/blocks-typed/domain.pddl
pbmFile :../src/test/resources/benchmarks/blocks-typed/p013.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p013.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (144 actions, 89 fluents)

Temps de recherche : 8.968

found plan as follows:

00: (unstack d g) [0]
01: ( put-down d) [0]
02: (unstack g e) [0]
03: (  stack g b) [0]
04: (unstack d h) [0]
05: (  stack d g) [0]
06: (unstack h f) [0]
07: (  stack h c) [0]
08: (  pick-up e) [0]
09: (  stack e h) [0]
10: (  pick-up f) [0]
11: (  stack f e) [0]
12: (unstack d c) [0]
13: (  stack d f) [0]
14: (unstack c a) [0]
15: (  stack c a) [0]

time spent:       0,02 seconds parsing 
                  0,06 seconds encoding 
                  0,00 seconds searching
                  0,08 seconds total time

memory used:      0,57 MBytes for problem representation
                  0,00 MBytes for searching
                  0,57 MBytes total


