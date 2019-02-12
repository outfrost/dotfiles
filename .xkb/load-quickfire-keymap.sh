#!/bin/bash
echo 'executed' $(date +'%F %T %Z') >> ~/.xkb/load-quickfire-keymap.log
echo 'DISPLAY ==' $DISPLAY >> ~/.xkb/load-quickfire-keymap.log
echo 'HOME ==' $HOME >> ~/.xkb/load-quickfire-keymap.log
xkbcomp -w 3 -I$HOME/.xkb ~/.xkb/keymap/quickfire $DISPLAY >> ~/.xkb/load-quickfire-keymap.log 2>&1
