#!/bin/bash
# Vars
# helpText =
# for convenient newlines
n="
"
tmk1="
##############
# Tarmak  1  #
##############

# Top Row:
keycode 18 = j
# Middle Row: 
keycode 36 = n
keycode 37 = e
# Bottom Row:
keycode 49 = k

##############"

tmk2="
##############
# Tarmak  2  #
##############

# Top Row:
keycode 18 = f
keycode 20 = g
# Middle Row:
keycode 33 = t
keycode 34 = j
keycode 36 = n
keycode 37 = e
# Bottom Row:
keycode 49 = k

##############"
tmk3="
##############
# Tarmak 3   #
##############

# Top Row:
keycode 18 = f
keycode 19 = j
keycode 20 = g
# Middle Row:
keycode 31 = r
keycode 32 = s
keycode 33 = t
keycode 34 = d
keycode 36 = n
keycode 37 = e
# Bottom Row:
keycode 49 = k

##############"
tmk4="
######################
# Tarmak 4           #
######################

# Top Row:
keycode 18 = f
keycode 19 = p
keycode 20 = g
keycode 21 = j
keycode 24 = y
keycode 25 = semicolon
# Middle Row:
keycode 31 = r
keycode 32 = s
keycode 33 = t
keycode 34 = d
keycode 36 = n
keycode 37 = e
keycode 39 = o
# Bottom Row:
keycode 49 = k

######################"

kmdir="/usr/share/kbd/keymaps"

# take input from user
## if ___ make keymaps in /usr/share/kbd/keymaps/
basemap=uk
# TODO: work out from vconsole
template=$(find $kmdir -name "$basemap.map.gz")

confirmation(){
	read -p "Using $template as template - is this correct? (y/n): " confirm
	case "$confirm" in
		y|Y|[Yy][Ee][Ss] ) echo "Confirmed. Continuing...";;
		* ) read -p "Not confirmed. Enter a different file to continue or press ^C (CTRL+C) to cancel:$n> " template; confirmation;; esac
}
confirmation

###if n, enter file to use as template:

## tell user how to apply kmp

## if ___ show current kmp 

## if __$ show tarmak$ kmp

## if -h show help

