WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/blocks-typed/domain.pddl
pbmFile :../src/test/resources/benchmarks/blocks-typed/p009.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p009.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (84 actions, 55 fluents)

Temps de recherche : 2.401

found plan as follows:

00: (unstack a d) [0]
01: ( put-down a) [0]
02: (unstack d b) [0]
03: ( put-down d) [0]
04: (unstack b f) [0]
05: ( put-down b) [0]
06: (unstack f e) [0]
07: ( put-down f) [0]
08: (unstack e c) [0]
09: ( put-down e) [0]
10: (  pick-up c) [0]
11: (  stack c d) [0]
12: (  pick-up b) [0]
13: (  stack b c) [0]
14: (  pick-up a) [0]
15: (  stack a b) [0]
16: (  pick-up f) [0]
17: (  stack f a) [0]
18: (  pick-up e) [0]
19: (  stack e f) [0]

time spent:       0,03 seconds parsing 
                  0,04 seconds encoding 
                  0,00 seconds searching
                  0,07 seconds total time

memory used:      0,35 MBytes for problem representation
                  0,00 MBytes for searching
                  0,35 MBytes total


