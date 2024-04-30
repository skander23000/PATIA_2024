WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/blocks-typed/domain.pddl
pbmFile :../src/test/resources/benchmarks/blocks-typed/p012.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p012.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (112 actions, 71 fluents)

Temps de recherche : 2.128

found plan as follows:

00: (unstack b e) [0]
01: ( put-down b) [0]
02: (unstack b f) [0]
03: ( put-down b) [0]
04: (unstack b c) [0]
05: (  stack b f) [0]
06: (unstack e f) [0]
07: (  stack e b) [0]
08: (unstack a d) [0]
09: (  stack a c) [0]
10: (  pick-up d) [0]
11: (  stack d a) [0]
12: (  pick-up f) [0]
13: (  stack f d) [0]

time spent:       0,03 seconds parsing 
                  0,07 seconds encoding 
                  0,00 seconds searching
                  0,10 seconds total time

memory used:      0,45 MBytes for problem representation
                  0,00 MBytes for searching
                  0,45 MBytes total


