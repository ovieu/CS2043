#!/bin/bash

# This is the URL from which we will retrieve the movie list
url=https://web.archive.org/web/20140301052344/http://www.movies.com/rss-feeds/top-ten-box-office-rss

# infinite loop!
while true; do
   clear # clear screen

   # Load the movie records into the variable webdata as a string
   webdata=$(curl $url 2> /dev/null)

   # Print the title of each movie
   #-> $"" [dollar sign + quotes] is a special quote that will cause 
   #  backslash-escaped characters to be replaced 
   #  as specified by the ANSI C standard.
   #  In effect, echo will recognize newline characters correctly.
   echo $"$webdata" | sed -En 's/<title><!\[CDATA\[(.*)\]\]><\/title>/\1/p' 
   # -E parameter: use the extended RegEx syntax
   # -n parameter: suppress automatic printing of pattern space
   # /p: print only the modified text.
   # -> So why do "-n /p"? Because by default, sed will print both modified and unmodified lines.
   #    However, we want only the modified expressions to be printed. "-n /p" will do exactly that.

   # Use the line break as a delimiter
   IFS=$'\n'  
   #-> $''[dollar sign + quotes] has the same purpose as in the preceding lines,
   # i.e., interpreting newline characters correctly.  

   # Extract movie descriptions and use them to create an array of movie descriptions. 
   # $(echo ... p') will return a multi-line string. The outer parenthese that encloses this $(echo...)
   # statement will parse this string with the delimiter chosen above (IFS) and create an array.
   desc=($(echo $"$webdata" | sed -En 's/<description><!\[CDATA\[(.*)\]\]><\/description>/"\1"/p'))
   # -> $""[dollar sign + double quotes] will cause the string to be translated according to the 
   #    current locale.

   # Print a blank line. With -e option, echo can handle backslash escapes.
   echo -e "\n"
   
   # -p option allows 'read' to print a string before reading the user's input.
   # First display the instruction, and then take the user input to the varaible $REPLY
   read -p "Choose a movie (1-10) > "
   
   # Display the movie description of the user's choice
   echo -e "\nMovie $REPLY \nSynopsis\n\n${desc[$REPLY]}"
   echo -e "\nPress enter to return"
   
   # Wait until the user presses enter.
   read 
done

