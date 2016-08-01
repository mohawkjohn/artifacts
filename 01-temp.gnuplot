set key left top
set xlabel "Time (s)"
set ylabel "Temperature (C)"
plot "01-temp.dat" using 1:2 with linespoints title "water downward", "01-temp.dat" using 1:3 with linespoints title "water sideways", "01-temp.dat" using 1:4 with linespoints title "table sideways"
