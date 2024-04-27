#!/bin/bash
VER_PYTHON="3"
PATH_LOG="./logs_benchmarks/"
PATH_STATS="./stats_benchmarks/"

BATCHES=("gripper/" "depot/" "blocks/" "logistics/")

for BATCH in "${BATCHES[@]}"; do
    for file in "$PATH_LOG$BATCH"*; do
        if [ -f "$file" ]; then
            filename=$(basename -- "$file" ".${file##*.}")
            echo "Traitement du log : $filename"
            echo $PATH_LOG$BATCH$filename.pddl
            python$VER_PYTHON ./benchmark_to_stats.py $PATH_LOG$BATCH$filename.pddl > $PATH_STATS$BATCH$filename.pddl
        fi
    done
done
