cat t* | tr '[:upper:]' '[:lower:]' | sed -e 's/\s/\n/g' | sort | uniq -c | sort -nr | head -10

