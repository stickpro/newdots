#!/bin/sh
#
# ufetch-gentoo - tiny system info for gentoo

## INFO

# user is already defined
host="$(hostname)"
os='Gentoo Linux'
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(ls -d /var/db/pkg/*/* | wc -l)"
shell="$(basename "$SHELL")"

## UI DETECTION

if [ -n "${DE}" ]; then
	ui="${DE}"
	uitype='DE'
elif [ -n "${WM}" ]; then
	ui="${WM}"
	uitype='WM'
elif [ -n "${XDG_CURRENT_DESKTOP}" ]; then
	ui="${XDG_CURRENT_DESKTOP}"
	uitype='DE'
elif [ -n "${DESKTOP_SESSION}" ]; then
	ui="${DESKTOP_SESSION}"
	uitype='DE'
elif [ -f "${HOME}/.xinitrc" ]; then
	ui="$(tail -n 1 "${HOME}/.xinitrc" | cut -d ' ' -f 2)"
	uitype='WM'
elif [ -f "${HOME}/.xsession" ]; then
	ui="$(tail -n 1 "${HOME}/.xsession" | cut -d ' ' -f 2)"
	uitype='WM'
else
	ui='unknown'
	uitype='UI'
fi

## DEFINE COLORS

# probably don't change these
if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold)"
	black="$(tput setaf 0)"
	red="$(tput setaf 1)"
	green="$(tput setaf 2)"
	yellow="$(tput setaf 3)"
	blue="$(tput setaf 4)"
	magenta="$(tput setaf 5)"
	cyan="$(tput setaf 6)"
	white="$(tput setaf 7)"
	reset="$(tput sgr0)"
fi

# you can change these
lc="${reset}${bold}${magenta}"      # labels
nc="${reset}${bold}${magenta}"      # user and hostname
ic="${reset}${bold}${white}"        # info
c0="${reset}${bold}${magenta}"      # first color
c1="${reset}${magenta}"             # second color

## OUTPUT

cat <<EOF

${c0}    .-----.      ${nc}${USER}${ic}@${nc}${host}${reset}
${c0}  .\`    _  \`.    ${lc}OS:        ${ic}${os}${reset}
${c0}  \`.   (${c1}_)   ${c0}\`.  ${lc}KERNEL:    ${ic}${kernel}${reset}
${c0}    \`${c1}.        /  ${lc}UPTIME:    ${ic}${uptime}${reset}
${c1}   .\`       .\`   ${lc}PACKAGES:  ${ic}${packages}${reset}
${c1}  /       .\`     ${lc}SHELL:     ${ic}${shell}${reset}
${c1}  \____.-\`       ${lc}${uitype}:        ${ic}${ui}${reset}

EOF

