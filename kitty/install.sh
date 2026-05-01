#!/bin/bash

echo "kitty.conf to kitty_old.conf"

mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty2.conf

echo "Coping the new config"

cp ./kitty.conf ~/.config/kitty

echo "finish"


