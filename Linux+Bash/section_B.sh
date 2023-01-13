#!/bin/bash

FILENAME="apache_logs.txt"

echo "1. From which ip were the most requests?"
awk '{ print $1}' $FILENAME | sort | uniq -c | sort -nr | head -n 1
echo "2. What is the most requested page?"
awk '{ print $7}' apache_logs.txt | sort | uniq -c | sort -nr | head -n 1
echo "3. How many requests were there from each ip?"
awk '{ print $1}' $FILENAME | sort | uniq -c | sort -nr
echo "4. What non-existent pages were clients referred to?"
awk '{ print $7}' apache_logs.txt | sort | uniq -c | sort -nr | grep 404
echo "5. What time did site get the most requests?"
awk '{ print $4}' apache_logs.txt | sort | uniq -c | sort -nr | head -n 10
echo "6. What search bots have accessed the site? (UA + IP)"
cat apache_logs.txt | grep /robots.txt > ROBOTS.txt
awk '{ print $15}' ROBOTS.txt | sort | uniq -c | sort -nr | head -n 1
cat apache_logs.txt | grep /sitemap1.xml.gz > ROBOTS.txt
awk '{ print $16}' ROBOTS.txt | sort | uniq -c | sort -nr | head -n 1
rm ROBOTS.txt











#Writed by mirexcool
