# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# bin/hex/dec converstion between various base numbers
function hex {
	for num in "$@"
	do
		if [ "${num:0:2}" == "0b" ]; then
			num="$((2#${num:2}))"
		fi
		printf "0x%0X " "$num"
	done
}

function bin {
	for num in $@
	do
		result=""
		if [ "${num:0:2}" == "0x" ]; then
			num="$((16#${num:2}))"
		fi
		while [ $num -ne 0 ] ; do
			result=$(( $num % 2 ))$result #residual is next digit
			num=$(( $num / 2 ))
		done
		echo -n "0b"$result" "
	done
}

function dec {
	for num in "$@"
	do
		case "${num:0:2}" in
			0b)
				echo -n "$((2#${num:2})) "
				;;
			0x)
				echo -n "$((16#${num:2})) "
				;;
			*)
				echo -n "$((num)) "
				;;
		esac
	done
}

# 'ff' command -- find string in files with a specified suffix
ff() {
  [[ -n $1 && -n $2 ]] || {
    echo "Usage ff [suffix] [string]"
    echo "Where"
    echo "  suffix  file suffix (without wildcards)"
    echo "  string  string to search for (quote if spaces)"
    return
  }
  find . -type f -name \*$1 -exec grep --color=always -Hn $2 "{}" \; | less -RFX
}

# Display ANSI line characters
export NCURSES_NO_UTF8_ACS=1

# Custom prompt
export PS1="\[\e[1;34m\]\w $\[\e[0m\] "

# Add Rust to path
. "$HOME/.cargo/env"
