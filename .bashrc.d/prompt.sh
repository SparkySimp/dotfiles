# set the special prompt for Sparky

if [ $USER == "sparky" ]; then
	PS1="[\u@\h \w]:3 "
else
	PS1="[\u@\h \w]\$ "
fi
