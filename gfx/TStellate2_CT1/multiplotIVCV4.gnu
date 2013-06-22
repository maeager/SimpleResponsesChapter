#!/usr/bin/gnuplot -persist

## FONTSIZE 18
set terminal postscript eps enhanced defaultplex \
   leveldefault mono solid\
   dashlength 1.0 linewidth 2.0 butt noclip \
   palfuncparam 2000,0.003 \
   "Helvetica" 18
#color solid
set output "../SimpleResponsesChapter/gfx/TStellate2_CT1/multiplotIVCV4.eps"

#set size 0.49,0.5
set multiplot layout 2,2 scale 1.1, 0.9
set style line 1 lc rgb "#0060ad" lt 1 lw 2 pt 7 ps 1.5 # --beautiful blue line and filled circle
set style line 2 lc rgb '#dd181f' lt 1 lw 2 pt 5 ps 1.5 # --beautiful red line and square
set style line 3 lc rgb '#00ad06' lt 1 lw 2 pt 9 ps 1.5 # --green line and triangle
set style line 4 lc rgb '#00ad06' lt 1 lw 2 pt 72 ps 1.5 # --green line and unfilled triangle

set style fill solid 1.0
set ylabel "Rate (sp/s)" font "Helvetica,18"  #offset character 0, 0, 0
set xlabel "Time (ms)" font "Helvetica,18"
set label 1 "{/Sans-Bold A}" at screen 0.075, screen 1 font "Arial,32"
plot [-10:90] '../SimpleResponsesChapter/gfx/TStellate2_CT1/psth_0.25.dat' i 0 u 1:2 notitle w boxes lc "black"
#plot [-10:90] 'psth_1.dat' i 0 u 1:2 not w boxes lc "black"


set key outside horiz center top  nobox

#load '../Responses/default.gnu'
set xtics nomirror out ("0-10" 0,"10-20" 1,"20-30" 2,"30-40" 3,"40-50" 4)
set xrange [-0.5:*]
set border 3
#set ytics nomirror out 0.1,0.1,0.5
set xlabel "Time Window" font "Helvetica,18"
set ylabel "\n\n CV " font "Helvetica,18" offset character +2, 0, 0
set yrange [0.1:0.4]
set ytics nomirror out 0.1,0.1,0.5
unset obj
set label 1 "{/Sans-Bold B}" at screen 0.55, screen 1 font "Arial,32"
# plot '< tail -4 TStellate.Fit.dat |  awk ''{print $3}'' ' u ($0):1 t "Test" w lp ls 1 lc 'black', \
#     '../TStellate/PaoliniBalancedInh-Fig2.png.dat' i 2 u 1:2:3 notitle w yerr lc rgb '#0060ad', \
#     '' i 2 u 1:2 t "Ref" w lp lc rgb '#0060ad' lt 1 lw 2 pt 5 ps 1.5

# plot [-0.5:3.5][0.1:0.5] '< grep -A4 -e ''CV reference'' ../SimpleResponsesChapter/gfx/TStellate2_CT1/TStellate.Fit.dat | tr ''#'' '' '' | tr ''-'' ''\n''| grep -v -e ''CV'' ' \
#      i 0 u 1:2 not  w lp ls 1 lc rgb '#AAAAAA', \
#      '' i 2 u 1:2 not w lp ls 1 lc rgb '#AAAAAA', \
#      '' i 1 u 1:2 t "Model" w lp ls 1 lc 'black', \
#      '' u 1:3 t "Ref" w lp lc rgb '#0060ad' lt 1 lw 2 pt 5 ps 1.5

plot [-0.5:3.5][0.1:0.5] '< grep -A4 -e ''CV reference'' ../SimpleResponsesChapter/gfx/TStellate2_CT1/TStellate.Fit.dat | tr ''#'' '' '' | tr ''-'' ''\n''| grep -v -e ''CV'' ' i 1 u 1:2 t "Model 30 dB" w lp ls 1 lc 'black', \
     '' i 0 u 1:2 t "Model 20 dB" w lp lt 3 lc rgb '#090909', \
     '' u 1:3 t "Reference" w lp lc rgb '#0060ad' lt 1 lw 2 pt 5 ps 1.5, \
     '' i 2 u 1:2 t "Model 40 dB" w lp lt 2 lc rgb '#090909'

     
unset key
#load '../Responses/default.gnu'
set xlabel "Time (msec)"  font "Helvetica,18" 
set ylabel "Membrane Voltage (mV)"  font "Helvetica,18" offset character -1, 0, 0
set border 3
#set ytics unset tics
unset x2tics
unset y2tics
set style rect fc lt -1 fs solid 0.15 noborder
set obj rect from -10, graph 0 to 0 , graph 1
set obj rect from 60 , graph 0 to 62, graph 1
set obj rect from 5  , graph 0 to 10, graph 1
set obj rect from 20 , graph 0 to 30, graph 1
set obj rect from 20 , graph 0 to 22, graph 1 fc lt -1 fs solid 0.25 noborder
set obj rect from 50 , graph 0 to 52, graph 1 fc lt -1 fs solid 0.25 noborder
set xrange [-10:90]
set yrange [-70:-25]
set xtics 0,20,80
set ytics -65,10,-25
set tics nomirror out
#set autoscale y
#set autoscale x
#set key center top title " " nobox
set label 1 "{/Sans-Bold C}" at screen 0.075,screen 0.5 font "Arial,32"

plot '../SimpleResponsesChapter/gfx/TStellate2_CT1/TStellate.Fit.dat' u ($1):2 t "Test" w l lc "black", \
     '< tail -137 ../SimpleResponsesChapter/gfx/TStellate/CT1-01-857-007.png.dat' u 1:2 t "Reference" w l lc rgb "#0060ad"
unset key

#set key right Right noreverse nobox

set border 11 #bottom,left+ right
#set ytics nomirror out 0.1,0.1,0.5
unset xlabel #"Time Window" font "Helvetica,18"
set arrow 1 from 0.5, graph 0 to 0.5, graph 1 nohead lt 8 lw 1.5 
unset ytics
unset obj
set ylabel "\n Ratio " font "Helvetica,18" offset character +2, 0, 0
set y2label "{/Symbol D}MP (mV)" font "Helvetica,18"
set xtics nomirror out rotate by -20 offset -1,0 ("Onset" 0,"Adaptation" 2,"Offset" 5)
set ytics nomirror 0,1,2
set y2tics
set tics out
#set autoscale  y
#set autoscale y2
set yrange [0:2]
set y2range [*:*]
set xrange [-0.5:6.5]
set x2range [-0.5:6.5]
set label 1 "{/Sans-Bold D}" at screen 0.55,screen 0.5 font "Arial,32"

plot '< awk ''/IVOnset/ {if ($3!=0) print $3,$4; end}'' ../SimpleResponsesChapter/gfx/TStellate2_CT1/TStellate.Fit.dat'  u 1 axes x1y1 t "Test" w lp lc "black" lt 1 lw 2 pt 7 ps 1.5, \
     '' u 2 axes x1y1 t "Ref" w lp ls 1 pt 5 ps 1.5, \
     '< awk ''/IVAdapt/ {if ($3!=0) print $3,$4; end}'' ../SimpleResponsesChapter/gfx/TStellate2_CT1/TStellate.Fit.dat' u ($0+1):(abs($2)) axes x2y2 not  w lp lc "black" lt 1 lw 2 pt 7 ps 1.5, \
     '' u ($0+1):(abs($1)) axes x2y2 not w lp ls 1 pt 5 ps 1.5, \
     '< awk ''/IVOffset/ {print $3,$4}'' ../SimpleResponsesChapter/gfx/TStellate2_CT1/TStellate.Fit.dat' u ($0+4):(abs($2)) axes x2y2 not w lp lc "black" lt 1 lw 2 pt 7 ps 1.5, \
     '' u ($0+4):(abs($1)) axes x2y2 not w lp ls 1 pt 5 ps 1.5 


#     '../SimpleResponsesChapter/gfx/TStellate/Paolini2005_Fig6A.Adapt.dat' i 0 u ($0+1):2 axes x2y2 not w lp ls 1 pt 5 ps 1.5, \
#     '< awk ''/IVOffset/ {print $3,$4}'' ../SimpleResponsesChapter/gfx/TStellate2_CT1/TStellate.Fit.dat' u ($0+4):(abs($2)) axes x2y2 not w lp lc "black" lt 1 lw 2 pt 7 ps 1.5, \
#     '' u ($0+4):(abs($1)) axes x2y2 not w lp ls 1 pt 5 ps 1.5, \
#          '../SimpleResponsesChapter/gfx//TStellate/Paolini2005_Fig6B.Offset.dat' i 0 u ($0+4):(abs($2))  axes x2y2 not w lp ls 1 pt 5 ps 1.5


# plot '< tail -7 TStellate.Fit.dat | head -1 | awk ''{print $3}'' ' axes x1y1 t "Test" w lp lc "black" lt 1 lw 2 pt 7 ps 1.5,\
#      '< tail -7 TStellate.Fit.dat | head -1 | awk ''{print $2}'' ' axes x1y1 t "Ref" w lp ls 1 pt 5 ps 1.5 , \
#      '< tail -6 TStellate.Fit.dat | head -2 | awk ''{print $3}'' ' u ($0+1):1 axes x2y2 notitle w p lc "black" lt 1 lw 2 pt 7 ps 1.5,\
#      '< tail -6 TStellate.Fit.dat | head -2 | awk ''{print $2}'' ' u ($0+1):1 axes x2y2 notitle w p ls 1 pt 5 ps 1.5

unset multiplot
!fixbb ../SimpleResponsesChapter/gfx/TStellate2_CT1/multiplotIVCV4.eps

