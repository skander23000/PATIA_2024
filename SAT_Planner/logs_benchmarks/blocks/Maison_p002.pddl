WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/blocks-typed/domain.pddl
pbmFile :../src/test/resources/benchmarks/blocks-typed/p002.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p002.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (40 actions, 29 fluents)

Temps de recherche : 0.163

found plan as follows:

00: (unstack b c) [0]
01: ( put-down b) [0]
02: (unstack c a) [0]
03: ( put-down c) [0]
04: (unstack a d) [0]
05: (  stack a b) [0]
06: (  pick-up c) [0]
07: (  stack c a) [0]
08: (  pick-up d) [0]
09: (  stack d c) [0]

time spent:       0,02 seconds parsing 
                  0,04 seconds encoding 
                  0,00 seconds searching
                  0,06 seconds total time

memory used:      0,19 MBytes for problem representation
                  0,00 MBytes for searching
                  0,19 MBytes total


