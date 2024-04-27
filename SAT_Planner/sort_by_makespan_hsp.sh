VER_PYTHON="3"

PATH_DATA="./data/"
PATH_STATS="./stats_benchmarks/"

BATCHES=("gripper/" "depot/" "blocks/" "logistics/")

for BATCH in "${BATCHES[@]}"; do
    for file in "$PATH_STATS$BATCH"*; do
        if [ -f "$file" ]; then
            filename=$(basename -- "$file" ".${file##*.}")
            echo "Traitement des stats : $filename"
            echo $PATH_STATS$BATCH$filename.pddl
            python$VER_PYTHON ./sort_by_makespan_hsp.py $PATH_STATS$BATCH
        fi
    done
done