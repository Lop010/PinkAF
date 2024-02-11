grim -g "$(slurp)" temp.jpg 
wl-copy < temp.jpg 

ANSWER=$(dunstify -A yes,ACCEPT -A no,DECLINE "Save Screenshot?")
case "$ANSWER" in "2")
	date="$(date +%d-%m-%y)"
	filename="screenshot_$date"
	echo "moving image"

	if ! test -f ~/Pictures/screenshots/$filename; then
  		mv temp.jpg ~/Pictures/screenshots/$filename
	else
		time=$(date +%T)
		mv temp.jpg ~/Pictures/screenshots/$filename-$time
	fi
	;;
	"1")
		rm temp.jpg
	;;
esac
