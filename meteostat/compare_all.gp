set multiplot layout 3,3 title "Weather measurements in Ezeiza (2024)" offset 0,0.5
unset border
unset key
set xtics axis
set ytics axis
set zeroaxis
set datafile separator comma
set style data points
set style line 1 pointtype 7 linecolor rgb "#ab000000"

set xlabel "Min Temperature";
set ylabel "Max Temperature";
plot "< awk -vOFS=, -F, 'FNR != 1 { print $1,$2,$3,$4,$5,$8,$10 }' data/2024-ezeiza.csv" using 3:4 linestyle 1
set xlabel "Avg Temperature"; set ylabel "Wind"    ; plot "" using 2:6 linestyle 1
set xlabel "Wind"           ; set ylabel "Pressure"; plot "" using 6:7 linestyle 1

# set logscale y 2
set ylabel "Rain"
set xlabel "Avg Temperature"; plot "" using 2:($5 > 0 ? $5 : NaN) linestyle 1
set xlabel "Wind"           ; plot "" using 6:($5 > 0 ? $5 : NaN) linestyle 1 ; set xtic rotate by -45 offset 0,0.75
set xlabel "Pressure"       ; plot "" using 7:($5 > 0 ? $5 : NaN) linestyle 1 ; set xtic rotate by 0 offset 0,-0.5
# unset logscale y

set ylabel "Pressure"
set xrange [-10:40]
set xlabel "Avg Temperature"; plot "" using 2:7 linestyle 1
set xlabel "Min Temperature"; plot "" using 3:7 linestyle 1
set xlabel "Max Temperature"; plot "" using 4:7 linestyle 1

