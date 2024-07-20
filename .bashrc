# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
export GTK_THEME=adwaita-dark-amoled
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/home/$USER/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"
alias gsup="sudo emerge --sync && sudo emerge -avuDN @world"
alias gup="sudo emerge -avuDN @world"
