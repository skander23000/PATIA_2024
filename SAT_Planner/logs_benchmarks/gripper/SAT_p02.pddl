WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/gripper/domain.pddl
pbmFile :../src/test/resources/benchmarks/gripper/p02.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p02.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (52 actions, 38 fluents)

Temps de recherche : 413.902

found plan as follows:

00: (pick ball1 rooma right) [0]
01: (      move rooma roomb) [0]
02: (drop ball1 roomb right) [0]
03: ( pick ball6 rooma left) [0]
04: ( drop ball6 roomb left) [0]
05: (pick ball4 rooma right) [0]
06: (drop ball4 roomb right) [0]
07: ( pick ball5 rooma left) [0]
08: ( pick ball3 rooma left) [0]
09: ( drop ball5 roomb left) [0]
10: (pick ball2 rooma right) [0]
11: (drop ball2 roomb right) [0]
12: ( drop ball3 roomb left) [0]

time spent:       0,02 seconds parsing 
                  0,03 seconds encoding 
                  0,00 seconds searching
                  0,05 seconds total time

memory used:      0,15 MBytes for problem representation
                  0,00 MBytes for searching
                  0,15 MBytes total


