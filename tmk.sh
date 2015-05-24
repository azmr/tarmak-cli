#!/bin/bash
# Vars
# helpText =
# for convenient newlines
n="
"
tmk1="\n
##############\n
# Tarmak  1  #\n
##############\n
\n
# Top Row:\n
keycode 18 = j\n
# Middle Row:\n
keycode 36 = n\n
keycode 37 = e\n
# Bottom Row:\n
keycode 49 = k\n
\n
##############"

tmk2="\n
##############\n
# Tarmak  2  #\n
##############\n
\n
# Top Row:\n
keycode 18 = f\n
keycode 20 = g\n
# Middle Row:\n
keycode 33 = t\n
keycode 34 = j\n
keycode 36 = n\n
keycode 37 = e\n
# Bottom Row:\n
keycode 49 = k\n
\n
##############"
tmk3="\n
##############\n
# Tarmak 3   #\n
##############\n
\n
# Top Row:\n
keycode 18 = f\n
keycode 19 = j\n
keycode 20 = g\n
# Middle Row:\n
keycode 31 = r\n
keycode 32 = s\n
keycode 33 = t\n
keycode 34 = d\n
keycode 36 = n\n
keycode 37 = e\n
# Bottom Row:\n
keycode 49 = k\n
\n
##############"
tmk4="\n
######################\n
# Tarmak 4           #\n
######################\n
\n
# Top Row:\n
keycode 18 = f\n
keycode 19 = p\n
keycode 20 = g\n
keycode 21 = j\n
keycode 24 = y\n
keycode 25 = semicolon\n
# Middle Row:\n
keycode 31 = r\n
keycode 32 = s\n
keycode 33 = t\n
keycode 34 = d\n
keycode 36 = n\n
keycode 37 = e\n
keycode 39 = o\n
# Bottom Row:\n
keycode 49 = k\n
\n
######################"

kmdir="/usr/share/kbd/keymaps"

# take input from user
## if ___ make keymaps in /usr/share/kbd/keymaps/
baseMap=uk
# TODO: work out from vconsole
baseMapFile="$baseMap.map.gz"
template=$(find $kmdir -name "$baseMapFile")

templateConfirmation(){
	read -p "Using $template as template - is this correct? (y/n): " confirm
	case "$confirm" in
		y|Y|[Yy][Ee][Ss] ) echo "Confirmed. Continuing...";;
		* ) read -p "Not confirmed. Enter a different file to continue or press ^C (CTRL+C) to cancel:$n> " template; templateConfirmation;;
	esac
}
templateConfirmation

oldPwd=$(pwd)
targetDir="$(cd ${template/$baseMapFile/""}/.. && pwd)/colemak"
cd $oldPwd
targetConfirmation(){
	read -p "Target directory for new keymaps is $targetDir - is this correct? (y/n): " confirm
	case "$confirm" in
		y|Y|[Yy][Ee][Ss] ) echo "Confirmed. Continuing...";;
		* ) read -p "Not confirmed. Enter a different directory to continue or press ^C (CTRL+C) to cancel:$n> " targetDir; targetConfirmation;;
	esac
}
targetConfirmation

for i in {1..4}
do
	cp -i $template "$targetDir/tarmak$i.map.gz"
	gunzip "$targetDir/tarmak$i.map.gz"
done

echo -e $tmk1 >> "$targetDir/tarmak1.map"
echo -e $tmk2 >> "$targetDir/tarmak2.map"
echo -e $tmk3 >> "$targetDir/tarmak3.map"
echo -e $tmk4 >> "$targetDir/tarmak4.map"

for i in {1..4}
do
	gzip "$targetDir/tarmak$i.map"
done

## tell user how to apply kmp

## if ___ show current kmp 

## if __$ show tarmak$ kmp

## if -h show help

