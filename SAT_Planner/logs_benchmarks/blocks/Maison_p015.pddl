WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/blocks-typed/domain.pddl
pbmFile :../src/test/resources/benchmarks/blocks-typed/p015.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p015.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (144 actions, 89 fluents)

Temps de recherche : 3.042

found plan as follows:

00: (unstack d f) [0]
01: (  stack d h) [0]
02: (unstack e g) [0]
03: (  stack e g) [0]
04: (unstack a b) [0]
05: (  stack a d) [0]
06: (unstack f g) [0]
07: (  stack f a) [0]
08: (  pick-up g) [0]
09: (  stack g f) [0]
10: (unstack b f) [0]
11: (  stack b e) [0]
12: (  pick-up c) [0]
13: (  stack c b) [0]

time spent:       0,02 seconds parsing 
                  0,06 seconds encoding 
                  0,00 seconds searching
                  0,08 seconds total time

memory used:      0,57 MBytes for problem representation
                  0,00 MBytes for searching
                  0,57 MBytes total


