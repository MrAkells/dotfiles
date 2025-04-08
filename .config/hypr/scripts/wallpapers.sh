#!/bin/bash

interval=300
walldir=~/Pictures/Wallpapers
monitor=$(hyprctl monitors | grep Monitor | awk '{print $2}')

while true; do
    img=$(find "$walldir" -type f | shuf -n 1)  # Выбираем случайное изображение
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$img"
    hyprctl hyprpaper wallpaper "$monitor, $img"
    sleep $interval
done

