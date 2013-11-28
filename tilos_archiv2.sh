#!/bin/bash
info=$(zenity --forms --title="Tilos archiv" --text="Melyik programot akarod hallgatni?" --separator=" " / --add-calendar="Dátum" --forms-date-format=%Y/%m/%d --add-entry="Óra" / --add-entry="Elsö / Második fele [0/1]:")

declare -a info=($info)

date=${info[0]}
h=${info[1]}
f=${info[2]}

echo ${date//\//}

if [ $h -lt 10 ]
then
  h="0$h"
fi

if [ $f -eq 0 ]
then
  f1=00
  f2=30
else
  f1=30
  f2=00
fi

mplayer http://tilos.hu/online/$date/tilosradio-${date//\//}-$h$f1.mp3;
if [ $f1 -eq 30 ]
then
  h=${h#0}
  let h=$h+1
  if [ $h -lt 10 ]
  then
    h="0$h"
  fi
fi
mplayer http://tilos.hu/online/$date/tilosradio-${date//\//}-$h$f2.mp3;

exit

