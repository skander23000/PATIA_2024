import sys
import os

filename = sys.argv[1]
basename = os.path.basename(filename) 
prefix = basename[:3]  # extrait les trois premières lettres du nom du fichier


with open(filename, "r") as file:
    lines = file.readlines()

makespan = 0
runtime = -1


if prefix == "HSP":
    for line in lines:
        if line.endswith('[0]\n'):
            makespan = makespan + 1
        if line.endswith('seconds searching\n'):
            line = line.strip()
            l = line.split(" ")
            runtime = l[0]

else:
    # Le SAT maison
    for line in lines:
        if line.endswith('[0]\n'):
            makespan = makespan + 1
        if line.startswith('Temps de recherche'):
            line = line.strip()
            l = line.split(" ")
            runtime = l[4]

print(makespan)
print(runtime)

