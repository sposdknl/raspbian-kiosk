xset s noblank
xset s off
xset -dpms

matchbox-window-manager &

while true; do
	if pgrep -x "chromium" 2>/dev/null; then
		pkill -9 chromium-browser 2>/dev/null;
	fi

	sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
	sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences
	rm /home/pi/.config/chromium/SingletonLock

	
	unclutter &
	/usr/bin/chromium-browser --kiosk --noerrdialogs --disable-default-apps --disable-single-click-autofill --disable-translate-new-ux --disable-translate --disable-infobars https://netbox.vofy.tech/login/?next=/
done
