if [[ $(tty) = /dev/tty1 ]] && [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx >/dev/null 2>&1
fi
