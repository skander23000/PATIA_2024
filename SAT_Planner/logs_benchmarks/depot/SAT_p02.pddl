WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
setMaxSteps :500
domainFile :../src/test/resources/benchmarks/depot-automatic/domain.pddl
pbmFile :../src/test/resources/benchmarks/depot-automatic/p02.pddl

parsing domain file "domain.pddl" done successfully
parsing problem file "p02.pddl" done successfully
# WARNING: Unable to get Instrumentation. Dynamic Attach failed. You may add this JAR as -javaagent manually, or supply -Djdk.attach.allowAttachSelf
# WARNING: Unable to attach Serviceability Agent. You can try again with escalated privileges. Two options: a) use -Djol.tryWithSudo=true to try with sudo; b) echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

problem instantiation done successfully (210 actions, 82 fluents)

Temps de recherche : 1.767

found plan as follows:

00: (        drive truck1 depot0 distributor1) [0]
01: (      unload hoist0 crate2 truck0 depot0) [0]
02: (        drive truck0 depot0 distributor0) [0]
03: (unload hoist2 crate0 truck1 distributor1) [0]
04: (unload hoist1 crate1 truck0 distributor0) [0]
05: (  drop hoist1 crate1 crate3 distributor0) [0]
06: ( lift hoist1 crate1 pallet2 distributor0) [0]
07: ( drop hoist2 crate0 pallet2 distributor1) [0]
08: ( lift hoist2 crate0 pallet0 distributor1) [0]
09: (       drop hoist0 crate2 pallet0 depot0) [0]

time spent:       0,03 seconds parsing 
                  0,14 seconds encoding 
                  0,00 seconds searching
                  0,18 seconds total time

memory used:      0,90 MBytes for problem representation
                  0,00 MBytes for searching
                  0,90 MBytes total


