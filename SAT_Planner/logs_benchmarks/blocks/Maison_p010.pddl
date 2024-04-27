WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/blocks-typed/domain.pddl
pbmFile :../src/test/resources/benchmarks/blocks-typed/p010.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p010.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (112 actions, 71 fluents)

Temps de recherche : 27.329

found plan as follows:

00: (unstack e c) [0]
01: ( put-down e) [0]
02: (unstack e d) [0]
03: ( put-down e) [0]
04: (unstack e g) [0]
05: ( put-down e) [0]
06: (unstack g b) [0]
07: (  stack g d) [0]
08: (unstack b a) [0]
09: (  stack b c) [0]
10: (unstack a f) [0]
11: (  stack a g) [0]
12: (unstack f c) [0]
13: (  stack f e) [0]
14: (unstack c d) [0]
15: (  stack c f) [0]
16: (  pick-up d) [0]
17: (  stack d b) [0]

time spent:       0,02 seconds parsing 
                  0,06 seconds encoding 
                  0,00 seconds searching
                  0,09 seconds total time

memory used:      0,45 MBytes for problem representation
                  0,00 MBytes for searching
                  0,45 MBytes total


