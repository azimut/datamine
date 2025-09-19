set title 'max and min temperature in Ezeiza'
set border 3
set tics nomirror
set xlabel "Date\n(month/year)"
set ylabel "Temperature\n(C°)"
set datafile separator comma
set xdata time
set xtic rotate by -45
set timefmt '%Y-%m-%d 00:00:00'
set format x '%m/%y'
set zeroaxis
plot "<awk -vOFS=, -F, 'NR != 1 { print $1,$3,$4 }' data/2024-ezeiza.csv" \
        using 1:2 with points linecolor rgb '#abba0000' pointtype 7 title 'min',\
     '' using 1:3 with points linecolor rgb '#ab0000ba' pointtype 7 title 'max'
