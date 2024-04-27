if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage : makespan or runtime"
    exit 2
fi

type=$1

BATCHES=("gripper" "depot" "blocks" "logistics")

for BATCH in "${BATCHES[@]}"; do


    echo "set terminal png size 800,500 enhanced background rgb 'white'" > gnuplot_script_$BATCH\_$type
    echo "set style line 1 lt 1 lw 1.5 pt 3 linecolor rgb '#2b63ff'" >> gnuplot_script_$BATCH\_$type

    if [ $type == "runtime" ] 
    then
        data_hsp="runtime_hsp"
        data_maison="runtime_maison"
        #min value
        ymin=($(sort -nk2 data/$BATCH/runtime_maison.dat | cut -d' ' -f2))
        #max value
        ymax=($(sort -rnk2 data/$BATCH/runtime_maison.dat | cut -d' ' -f2))
        echo "set output 'gnuplot/runtime_$BATCH.png'" >> gnuplot_script_$BATCH\_$type
    else
        data_hsp="makespan_hsp"
        data_maison="makespan_maison"
        #min value
        ymin=($(sort -nk2 data/$BATCH/makespan_maison.dat | cut -d' ' -f2))
        #max value
        ymax=($(sort -rnk2 data/$BATCH/makespan_maison.dat | cut -d' ' -f2))
        echo "set output 'gnuplot/makespan_$BATCH.png'" >> gnuplot_script_$BATCH\_$type

    fi
    xmin=1
    #nombre de problèmes
    xmax=($(wc -l data/$BATCH/makespan_hsp.dat))

    echo "set autoscale" >> gnuplot_script_$BATCH\_$type
    echo "set xtic auto" >> gnuplot_script_$BATCH\_$type
    echo "set ytic auto" >> gnuplot_script_$BATCH\_$type 
    echo "set title '$type $BATCH'" >> gnuplot_script_$BATCH\_$type
    echo "set ylabel '$type'" >> gnuplot_script_$BATCH\_$type
    echo "set xlabel 'Probleme'" >> gnuplot_script_$BATCH\_$type
    echo "set xr [$xmin:$xmax]" >> gnuplot_script_$BATCH\_$type
    echo "set yr [$ymin:$ymax]" >> gnuplot_script_$BATCH\_$type
    echo "set key" >> gnuplot_script_$BATCH\_$type
    echo "set linetypes 1 lc rgb 'red' " >> gnuplot_script_$BATCH\_$type
    echo "set linetypes 2 lc rgb 'blue' " >> gnuplot_script_$BATCH\_$type
    echo "set logscale yr" >> gnuplot_script_$BATCH\_$type
    echo "plot 'data/$BATCH/$data_hsp.dat' using 0:2:xticlabels(1) with lines linetype 1 title \"HSP\", \
        'data/$BATCH/$data_maison.dat' using 0:2:xticlabels(1) with lines linetype 2" title \"Maison\" >> gnuplot_script_$BATCH\_$type

    gnuplot gnuplot_script_$BATCH\_$type
    rm gnuplot_script_$BATCH\_$type

done