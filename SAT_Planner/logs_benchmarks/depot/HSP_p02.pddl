WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p02.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (210 actions, 82 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

00: (       lift hoist0 crate0 pallet0 depot0) [0]
01: (        load hoist0 crate0 truck0 depot0) [0]
02: (  lift hoist2 crate2 crate1 distributor1) [0]
03: (        drive truck0 depot0 distributor1) [0]
04: (  load hoist2 crate2 truck0 distributor1) [0]
05: ( lift hoist2 crate1 pallet2 distributor1) [0]
06: (  load hoist2 crate1 truck0 distributor1) [0]
07: (unload hoist2 crate0 truck0 distributor1) [0]
08: (        drive truck0 distributor1 depot0) [0]
09: (      unload hoist0 crate2 truck0 depot0) [0]
10: (        drive truck0 depot0 distributor0) [0]
11: (       drop hoist0 crate2 pallet0 depot0) [0]
12: (unload hoist1 crate1 truck0 distributor0) [0]
13: (  drop hoist1 crate1 crate3 distributor0) [0]
14: ( drop hoist2 crate0 pallet2 distributor1) [0]

time spent:       0,03 seconds parsing 
                  0,13 seconds encoding 
                  0,06 seconds searching
                  0,22 seconds total time

memory used:      0,90 MBytes for problem representation
                  0,05 MBytes for searching
                  0,95 MBytes total


