#check if dbus is started if not, start it! - is done with tmp file
if [ ! -f "/tmp/dbus-started" ]; then
	dbus-launch --sh-syntax > /tmp/dbus-started
	eval `cat /tmp/dbus-started`
	/usr/libexec/bluetooth/obexd &
else 
	#set only environment variables
	eval `cat /tmp/dbus-started`
fi

