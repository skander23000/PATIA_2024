WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.

parsing domain file "domain.pddl" done successfully
parsing problem file "p01.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (90 actions, 46 fluents)

* Starting ASTAR search with FAST_FORWARD heuristic 
* ASTAR search succeeded

found plan as follows:

00: (       lift hoist0 crate1 pallet0 depot0) [0]
01: ( lift hoist1 crate0 pallet1 distributor0) [0]
02: (        load hoist0 crate1 truck1 depot0) [0]
03: (        drive truck1 depot0 distributor0) [0]
04: (  load hoist1 crate0 truck1 distributor0) [0]
05: (unload hoist1 crate1 truck1 distributor0) [0]
06: (  drive truck1 distributor0 distributor1) [0]
07: ( drop hoist1 crate1 pallet1 distributor0) [0]
08: (unload hoist2 crate0 truck1 distributor1) [0]
09: ( drop hoist2 crate0 pallet2 distributor1) [0]

time spent:       0,03 seconds parsing 
                  0,07 seconds encoding 
                  0,02 seconds searching
                  0,12 seconds total time

memory used:      0,41 MBytes for problem representation
                  0,01 MBytes for searching
                  0,42 MBytes total


