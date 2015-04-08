sed -n 255,298p frankenstein.txt > frankenstein2.txt
tr '[:upper:]' '[:lower:]' < frankenstein2.txt > frankenstein3.txt
tr -d [:punct:] < frankenstein3.txt > frankenstein4.txt
sed -e 's/\s/\n/g' < frankenstein4.txt | sort | uniq -c | sort -nr | head -11 > frankenstein5.txt
tr -d [:digit:] < frankenstein5.txt > frankenstein6.txt
cat frankenstein6.txt
