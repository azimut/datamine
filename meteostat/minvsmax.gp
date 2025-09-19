# set hidden3d
# set isosamples 60
# set samples 60

set title "Relation between min and max temperatures"
set xlabel "min\n(C°)"
set ylabel "max\n(C°)"
unset key
unset border
set xtics axis
set ytics axis
set zeroaxis
set datafile separator comma
f(x) = x + 10
#set terminal wxt
set zrange [1000:1400]
splot "< awk -vOFS=, -F, 'FNR != 1 { print $1,$8,$5,$10 }' data/2024-ezeiza.csv" \
        using 2:3:4
#pause 10000
