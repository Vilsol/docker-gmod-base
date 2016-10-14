# !/bin/bash

update_server() {
	APP_ID=$1
	DIR=$2

	if [ ! -d "$DIR" ]; then
		mkdir -p "$DIR"
	fi

	if [ ! -d "$DIR" ]; then
		echo "ERROR! Cannot create directory $DIR!"
		exit 1
	fi

	/home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir "$DIR" +app_update $APP_ID validate +quit
}

update_server 4020 "/home/steam/gmod/"

exit 0
