WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/blocks-typed/domain.pddl
pbmFile :../src/test/resources/benchmarks/blocks-typed/p003.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p003.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (40 actions, 29 fluents)

Temps de recherche : 0.097

found plan as follows:

0: (unstack c b) [0]
1: (  stack c d) [0]
2: (  pick-up b) [0]
3: (  stack b c) [0]
4: (  pick-up a) [0]
5: (  stack a b) [0]

time spent:       0,03 seconds parsing 
                  0,04 seconds encoding 
                  0,00 seconds searching
                  0,06 seconds total time

memory used:      0,19 MBytes for problem representation
                  0,00 MBytes for searching
                  0,19 MBytes total


