wc -c t* | sort -nr  | tail -1 | head -1 | awk {'print $1'} > min_chars.txt
wc -c t* | sort -n | tail -2 | head -1 | awk {'print $1'} > max_chars.txt
total2=$(wc -c t* | sort -n | tail -1 | head -1 | awk {'print $1'})
number2=2000
echo $total2 / $number2 | bc > avg_chars.txt
