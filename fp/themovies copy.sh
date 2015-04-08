#! /usr/bin/env bash

pause(){
	read -p "Press enter to return" key
}
while :
do
	clear
	curl http://web.archive.org/web/20140301052344/http://www.movies.com/rss-feeds/top-ten-box-office-rss 2> /dev/null | sed -n s/title//p | sed -n s/CDATA//p | sed -n s/title//p  | tr -d '[]'| tr -d '<>'| tr -d '</>' | tr -d '!'
	array=$(curl http://web.archive.org/web/20140301052344/http://www.movies.com/rss-feeds/top-ten-box-office-rss 2> /dev/null | sed -n s/description//p | sed -n s/description//p | sed -n s/CDATA//p | tr -d '[]' | tr -d '<>' | tr -d '</>' | tr -d '!')
	IFS=$'\n'
	set -- $array
	a=( $@ )
	read -r -p "Chose a movie (1-10) > " c
	case $c in
		1) echo "Movie" $c; echo $2; pause;;
		2) echo "Movie" $c; echo $3; pause;;
		3) echo "Movie" $c; echo $4; pause;;
		4) echo "Movie" $c; echo $5; pause;;
		5) echo "Movie" $c; echo $6; pause;;
		6) echo "Movie" $c; echo $7; pause;;
		7) echo "Movie" $c; echo $8; pause;;
		8) echo "Movie" $c; echo ${a[8]}; pause;;
		9) echo "Movie" $c; echo ${a[9]}; pause;;
		10) echo "Movie" $c; echo ${a[10]}; pause;;
		*) pause;;
	esac
done
