unset border
set xtics axis
set ytics axis
set zeroaxis
set datafile separator comma
set style data boxes
set style fill solid border -1

width = 2
bin(x,width) = width * floor(x / width)
set ylabel "Frequency"

set multiplot layout 2,2 title "Weather measurements in Ezeiza (2024)" offset 0,0.5

set key top center
set xlabel "Temperature\n(C°)"
plot "< awk -vOFS=, -F, 'NR != 1 { print $1,$2,$3,$4,$5,$8,$10 }' data/2024-ezeiza.csv" \
        using (bin($4,width)) fillcolor "#ab0000ba" smooth freq title "max",\
     "" using (bin($3,width)) fillcolor "#abba0000" smooth freq title "min"

unset key
set xlabel "Wind\n(km/h)"
plot "" using (bin($6,width)) fc "#ab000000" smooth freq

set logscale y 2
set xlabel "Rain\n(mm)"
plot "" using (bin($5,width)) fc "#ab000000" smooth freq
unset logscale y

set xtic rotate by -45 offset 0,1.25
set xlabel "Pressure\n(hPa)"
plot "" using (bin($7,width)) fc "#ab000000" smooth freq
