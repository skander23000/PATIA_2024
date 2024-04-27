import sys
import os
import numpy as np

dir = sys.argv[1]
name_problem = str(dir)

nb_problems = 0
for filename in os.listdir(dir):
    nb_problems+=1
nb_problems=int(nb_problems/2)
i = 0
k = 0
makespan_hsp = np.zeros(nb_problems, dtype=int)
runtime_hsp = np.zeros(nb_problems, dtype=float)
makespan_maison = np.zeros(nb_problems, dtype=int)
runtime_maison = np.zeros(nb_problems, dtype=float)

nb_problem_makespan = np.zeros(nb_problems, dtype=int)
nb_problem_runtime = np.zeros(nb_problems, dtype=int)

for filename in os.listdir(dir):
    with open(os.path.join(dir, filename), 'r') as f:
        if (f.name.__contains__("HSP")):
            lines = f.readlines()
            makespan_hsp[i] = lines[0]
            runtime_hsp[i] = float(lines[1][:-1].replace(",","."))
            nb_problem_makespan[i] = i + 1
            nb_problem_runtime[i] = i + 1
            i = i+1
        elif (f.name.__contains__("Maison")):
            lines = f.readlines()
            makespan_maison[k] = lines[0]
            runtime_maison[k] = float(lines[1][:-1].replace(",","."))
            k = k + 1
# sorting both arrays with increasing hsp makespan order
makespan_hsp, makespan_maison, nb_problem_makespan = (list(t) for t in zip(*sorted(zip(makespan_hsp, makespan_maison, nb_problem_makespan))))
# sorting both arrays with increasing hsp runtime order
runtime_hsp, runtimemaison, nb_problem_runtime = (list(t) for t in zip(*sorted(zip(runtime_hsp, runtime_maison, nb_problem_runtime))))

dir = dir.replace("stats_benchmarks","")
datafile_makespan_hsp = open("data/"+dir+"/makespan_hsp.dat", "w")
datafile_runtime_hsp = open("data/"+dir+"/runtime_hsp.dat", "w")
datafile_makespan_maison = open("data/"+dir+"/makespan_maison.dat", "w")
datafile_runtime_maison = open("data/"+dir+"/runtime_maison.dat", "w")
for j in range (0,i):
    m_hsp = str(nb_problem_makespan[j]) + " " + str(makespan_hsp[j]) + "\n"
    m_maison = str(nb_problem_makespan[j]) +" " + str(makespan_maison[j]) + "\n"
    r_hsp = str(nb_problem_runtime[j]) + " " + str(runtime_hsp[j]) + "\n"
    r_maison = str(nb_problem_runtime[j]) + " " + str(runtime_maison[j]) + "\n"
    datafile_makespan_hsp.write(m_hsp)
    datafile_makespan_maison.write(m_maison)
    datafile_runtime_hsp.write(r_hsp)
    datafile_runtime_maison.write(r_maison)


datafile_makespan_hsp.close()
datafile_runtime_hsp.close()
datafile_makespan_maison.close()
datafile_runtime_maison.close()