set term postscript eps enhanced color size 4,3 font "Helvetica,14"
set output "001.eps"
set key right top
set xlabel "Wavelength (um)"
set ylabel "Reflectance (%)"
plot "001.dat" using 1:2 with lines title "sample 001", "quartz_standard.dat" using 1:2 with lines title "quartz standard"

set term postscript eps enhanced color size 4,3 font "Helvetica,14"
set output "002.eps"
set key right top
set xlabel "Wavelength (um)"
set ylabel "Reflectance (%)"
plot "002.dat" using 1:2 with lines title "sample 002", "quartz_standard.dat" using 1:2 with lines title "quartz standard"

set term postscript eps enhanced color size 4,3 font "Helvetica,14"
set output "003.eps"
set key right top
set xlabel "Wavelength (um)"
set ylabel "Reflectance (%)"
plot "003.dat" using 1:2 with lines title "sample 003", "quartz_standard.dat" using 1:2 with lines title "quartz standard"

set term postscript eps enhanced color size 4,3 font "Helvetica,14"
set output "004.eps"
set key right top
set xlabel "Wavelength (um)"
set ylabel "Reflectance (%)"
plot "004.dat" using 1:2 with lines title "sample 004", "topaz_standard.dat" using 1:2 with lines title "topaz standard"

set term postscript eps enhanced color size 4,3 font "Helvetica,14"
set output "005-006.eps"
set key right top
set xlabel "Wavelength (um)"
set ylabel "Reflectance (%)"
plot "005.dat" using 1:2 with lines title "sample 005", "006.dat" using 1:2 with lines title "sample 006", "obsidian_standard.dat" using 1:2 with lines title "obsidian standard"

set term postscript eps enhanced color size 4,3 font "Helvetica,14"
set output "007.eps"
set key right top
set xlabel "Wavelength (um)"
set ylabel "Reflectance (%)"
plot "007.dat" using 1:2 with lines title "sample 007", "quartz_standard.dat" using 1:2 with lines title "quartz standard"

set term postscript eps enhanced color size 4,3 font "Helvetica,14"
set output "008.eps"
set key right top
set xlabel "Wavelength (um)"
set ylabel "Reflectance (%)"
plot "008.dat" using 1:2 with lines title "sample 008", "quartz_standard.dat" using 1:2 with lines title "quartz standard"
