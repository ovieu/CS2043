
tr '[:upper:]' '[:lower:]' < frankenstein.txt > frankenstein3.txt
tr -d [:punct:] < frankenstein3.txt > frankenstein4.txt
fgrep 
sed -e 's/\s/\n/g' < frankenstein4.txt | sort | uniq -c | sort -nr | head -101 >$
tr -d [:digit:] < frankenstein5.txt > frankenstein6.txt
cat frankenstein6.txt

