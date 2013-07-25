#!/usr/bin/env bash

# Background colour
background_color='#227722882222'
gconftool-2 -s -t string /apps/guake/style/background/color $background_color

# Normal font colour
foreground_color='#ff99ff88ff55'
gconftool-2 -s -t string /apps/guake/style/font/color $foreground_color

# Palette of 16 colours
color_1='#227722882222'
color_2='#ffbb99ffbb11'
color_3='#aa66ee2222ee'
color_4='#ffdd997711ff'
color_5='#6666dd99eeff'
color_6='#aaee8811ffff'
color_7='#aa11eeffee44'
color_8='#ff55ff44ff11'
color_9='#338833883300'
color_10='#ddeeaaff88ff'
color_11='#aacccc226677'
color_12='#ff44bbff7755'
color_13='#66ffcc22eeff'
color_14='#ee11aa33eeee'
color_15='#1122ccffcc00'
color_16='#ff99ff88ff55'

gconftool-2 -s -t string /apps/guake/style/font/palette `echo $color_1:$color_2:$color_3:$color_4:$color_5:$color_6:$color_7:$color_8:$color_9:$color_10:$color_11:$color_12:$color_13:$color_14:$color_15:$color_16`
