wc -w t* | sort -nr  | tail -2 | head -1 | awk {'print $1'} > min_words.txt
wc -w t* | sort -n | tail -2 | head -1 | awk {'print $1'} > max_words.txt
total=$(wc -w t* | sort | tail -1 | head -1 | awk {'print $1'})
number=2000
echo $total / $number | bc > avg_words.txt
