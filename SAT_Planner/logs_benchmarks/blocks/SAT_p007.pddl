WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/blocks-typed/domain.pddl
pbmFile :../src/test/resources/benchmarks/blocks-typed/p007.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p007.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (84 actions, 55 fluents)

Temps de recherche : 0.365

found plan as follows:

00: (unstack d a) [0]
01: ( put-down d) [0]
02: (unstack f e) [0]
03: (  stack f d) [0]
04: (unstack e b) [0]
05: (  stack e f) [0]
06: (unstack a c) [0]
07: (  stack a e) [0]
08: (  pick-up b) [0]
09: (  stack b a) [0]
10: (  pick-up c) [0]
11: (  stack c b) [0]

time spent:       0,02 seconds parsing 
                  0,05 seconds encoding 
                  0,00 seconds searching
                  0,08 seconds total time

memory used:      0,35 MBytes for problem representation
                  0,00 MBytes for searching
                  0,35 MBytes total


