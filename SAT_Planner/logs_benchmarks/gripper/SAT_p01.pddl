WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/gripper/domain.pddl
pbmFile :../src/test/resources/benchmarks/gripper/p01.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p01.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (36 actions, 28 fluents)

Temps de recherche : 0.456

found plan as follows:

0: (      move rooma roomb) [0]
1: (pick ball1 rooma right) [0]
2: ( pick ball3 rooma left) [0]
3: (pick ball4 rooma right) [0]
4: ( drop ball3 roomb left) [0]
5: (drop ball1 roomb right) [0]
6: (drop ball4 roomb right) [0]
7: ( pick ball2 rooma left) [0]
8: ( drop ball2 roomb left) [0]

time spent:       0,02 seconds parsing 
                  0,03 seconds encoding 
                  0,00 seconds searching
                  0,04 seconds total time

memory used:      0,11 MBytes for problem representation
                  0,00 MBytes for searching
                  0,11 MBytes total


