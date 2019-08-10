#!/bin/bash

filename=$1
filenamewithoutextension="${filename%.*}"

leftright=$2
topbottom=$3

width=$(identify -ping -format '%w' $filename)
height=$(identify -ping -format '%h' $filename)

calculated_with=$((width-leftright*2))
calculated_height=$((height-topbottom*2))

convert $filename -fill none -stroke gray -draw "stroke-dasharray 5 5 rectangle ${leftright},${topbottom} ${calculated_with},${calculated_height}" $filenamewithoutextension"_stroke".png
convert $filenamewithoutextension"_stroke".png scissors.png -geometry -6+50 -composite -format jpg -quality 100 $filenamewithoutextension"_final".jpg

