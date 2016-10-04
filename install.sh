#!/bin/bash

# VARS ________________________________________________________________________

GH_URL="https://raw.githubusercontent.com/Jeff-Russ/gits/master/"


# funcs _______________________________________________________________________

exiterr () {
	printf "\nERROR: $1\nNow exiting...\n"
	exit 1
}
warning_mgs () {
	printf "\nWARNING: $1\n"
}

not_in_path () { echo "$PATH"|grep -q "$1" && return 1 || return 0; }
dir_missing ()  { [ -d "$1" ] && return 1 || return 0; }
dir_found ()  { [ -d "$1" ] && return 0 || return 1; }
file_found () { [ -f "$1" ] && return 0 || return 1; }
str_eq () { [[ "$1" = "$2" ]] && return 0 || return 1; }
is_z () { [[ -z "$1" ]] && return 0 || return 1; }


#  ~/bin directory ____________________________________________________________

if dir_missing "$HOME/bin"; then

	printf "making ~/bin directory ... "
	mkdir "$HOME/bin" && echo "Done." || exiterr "mkdir $HOME/bin failed."

 else echo "$HOME/bin found ... "
fi


if not_in_path "$HOME/bin"; then

	printf "appending ~/.bash_profile to add ~/bin to \$PATH... "
	apnd="export PATH=\$PATH:\"$HOME/bin\""
	echo "$apnd" >> "$HOME/.bash_profile" && echo "Done." || exiterr "append failed."

 else echo "~/bin was already added to PATH."
fi

HMBIN="$HOME/bin"
cd "$HMBIN"

#  downloads __________________________________________________________________


if str_eq "$1" "--update"; then 

	tmp="$HOME/bin/gits_temp"

	if dir_missing "$tmp"; then
		mkdir "$tmp" || exiterr " mkdir ~bin/gits_temp failed."
	fi

	if file_found "$HMBIN/gits"; then 
		mv "$HOME/bin/gits" "$tmp/gits" || exiterr " mv ~/bin/gits $dtmp/gits failed."
	fi

	if file_found "$HMBIN/GITS.1"; then 
		mv "$HOME/bin/gits" "$tmp/gits" || exiterr " mv ~/bin/GITS.1 $dtmp/GITS.1 failed."
	fi
fi

printf "downloading gits command executable... "
curl -O "$GH_URL/gits" && echo "Done." || exiterr "curl -O $GH_URL/gits failed."

printf "downloading man page... "
curl -O "$GH_URL/GITS.1" && echo "Done." || exiterr "curl -O $GH_URL/GITS.1 failed."

if str_eq "$1" "--update"; then 
	file_found "$HOME/bin/gits_temp/gits" && rm "$HOME/bin/gits_temp/gits"
	file_found "$HOME/bin/gits_temp/GITS.1" && rm "$HOME/bin/gits_temp/GITS.1"
	contents="$(ls -A "$HOME/bin/gits_temp/" 
	is_z "$contents" && rm -rf "$HOME/bin/gits_temp/"
fi





