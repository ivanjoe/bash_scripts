#!/bin/bash
#mplayer http://zsuffajazz.hu/aktualis_adas_$p.mp3
title="Zsuffa Jazz müsor lejátszó"
prompt="Válassz részt:"
options=("1" "2" "3")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 

  case "$REPLY" in

    1 ) echo "OK. Lejátszás indul az $opt. résszel";
        mplayer http://zsuffajazz.hu/aktualis_adas_1.mp3;
        mplayer http://zsuffajazz.hu/aktualis_adas_2.mp3;
        mplayer http://zsuffajazz.hu/aktualis_adas_3.mp3;
        break;;
    2 ) echo "OK. Lejátszás indul az $opt. résszel";
        mplayer http://zsuffajazz.hu/aktualis_adas_2.mp3;
        mplayer http://zsuffajazz.hu/aktualis_adas_3.mp3;
        break;;
    3 ) echo "OK. Lejátszás indul az $opt. résszel";
        mplayer http://zsuffajazz.hu/aktualis_adas_3.mp3;
        break;;

    $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
    *) echo "Nem, nem. Újra!";continue;;
  esac
done

#while opt=$(zenity --title="$title" --text="$prompt" --list --column="Options" "${options[@]}"); do
#  case "$opt" in
#    "${options[0]}" ) zenity --info --text="You picked $opt, option 1";;
#    "${options[1]}" ) zenity --info --text="You picked $opt, option 2";;
#    "${options[2]}" ) zenity --info --text="You picked $opt, option 3";;
#    *) zenity --error --text="Invalid option. Try another one.";;
#  esac
#done
