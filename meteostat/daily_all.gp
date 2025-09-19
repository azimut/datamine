set border 3
set tics nomirror

unset key

set format x '%m/%y'
set xtic rotate by -45

set datafile separator comma
set xdata time
set timefmt '%Y-%m-%d 00:00:00'
set style data points
set style line 1 pointtype 7 linecolor rgb "#8a000000"
set style line 2 linewidth 4 linecolor rgb "#000000"

nbins = floor(12 * 2)

set multiplot layout 2,2 title "Weather measurements in Ezeiza (2023-2024)" offset 0,0.5

set ylabel 'avg temp'
plot "<awk -vOFS=, -F, 'FNR != 1 { print $1,$2,$3,$4,$5,$8,$10 }' data/2023-ezeiza.csv data/2024-ezeiza.csv" \
        using 1:2 ls 1,\
     '' using 1:2 with lines ls 2 bins=nbins binvalue=avg

set logscale y 2
set ylabel 'Rain'
plot '' using 1:5 ls 1
unset logscale y

set ylabel 'Wind'
plot '' using 1:6 ls 1,\
     '' using 1:6 with lines ls 2 bins=nbins binvalue=avg

set yrange [ 990 : 1040 ]
set ylabel 'Pressure'
plot '' using 1:($7 > 0 ? $7 : NaN) ls 1,\
     '' using 1:($7 > 0 ? $7 : NaN) with lines ls 2 bins=nbins binvalue=avg
