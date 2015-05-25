#!/bin/bash
# Vars
# helpText =
# for convenient newlines
n="
"
tmk=("\n
##############\n
# Tarmak  1\n
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
"\n
##############\n
# Tarmak  2\n
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
"\n
##############\n
# Tarmak 3\n
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
"\n
######################\n
# Tarmak 4\n
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
######################")

kmdir="/usr/share/kbd/keymaps"

# take input from user
## if ___ make keymaps in /usr/share/kbd/keymaps/
baseMap=$(cat /etc/vconsole.conf | grep -oPi "(?<=keymap=)\S+")
if [ -z "$baseMap" ]
	then
		baseMap="us"
fi

echo "baseMap: $baseMap"
# TODO: work out from vconsole
baseMapFile="$baseMap.map.gz"
template=$(find $kmdir -name "$baseMapFile")

# TODO: make default file/dir in prompt
templateConfirmation(){
	read -p "Using $template as template - is this ok? (y/n): " confirm
	case "$confirm" in
		y|Y|[Yy][Ee][Ss] ) echo "Confirmed. Continuing...";;
		* ) read -p "Not confirmed. Enter a file to use or press ^C (CTRL+C) to cancel:$n> " template; templateConfirmation;;
	esac
}
templateConfirmation

oldPwd=$(pwd)
targetDir="$(cd ${template/$baseMapFile/""}/.. && pwd)/colemak"
cd $oldPwd
targetConfirmation(){
	read -p "Target for new keymaps is $targetDir - is this ok? (y/n): " confirm
	case "$confirm" in
		y|Y|[Yy][Ee][Ss] ) echo "Confirmed. Continuing...";;
		* ) read -p "Not confirmed. Enter a directory to use or press ^C (CTRL+C) to cancel:$n> " targetDir; targetConfirmation;;
	esac
}
targetConfirmation

for i in ${!tmk[@]}
do
	((j=$i+1))
	cp -i $template "$targetDir/tarmak$j.map.gz"
	gunzip "$targetDir/tarmak$j.map.gz"
	echo -e ${tmk[$i]} >> "$targetDir/tarmak$j.map"
	gzip "$targetDir/tarmak$j.map"
done

echo "All done! Now use \"sudo loadkeys tarmak\$\" (replace \"\$\" with 1-4) to load one of the new keymaps."
## tell user how to apply kmp

## if ___ show current kmp 

## if __$ show tarmak$ kmp

## if -h show help

