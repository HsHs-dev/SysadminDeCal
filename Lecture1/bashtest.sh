#!/bin/bash

# This is a comment so it won't show UP

name="Hassan"
echo "$name"

foo=1
# $foo + 1 wrong

expr $foo + 1

read -p "send: " FOO

echo "sent: $FOO"

BAR=$(expr 1 + 1)
echo "$BAR"

# -eq ==
# -ne !=
# -gt >
# -ge >=
# -lt <
# -le <=
test zero = zero; echo $?
test zero = one; echo $?

[ 0 -lt 1 ] && [ 0 -gt 1 ];
echo $?

[ 0 -lt 1 ] || [ 0 -gt 1 ]; 
echo $?


echo "================="
[ 0 -lt 1 -o 0 -gt 1 ]; echo $?
echo "================="

# read -p "Enter a number (try 79 or 42): " NUM

# $1 is a 'positional parameter' ./bashtest.sh 44 66
# 44 is $1 and 66 is $2
if [ "$1" -eq 79 ];
then
  echo "nice"
elif [ "$1" -eq 42 ];
then
  echo "The answer!"
else
  echo "What are numbers"
fi

echo "===================================="

read -p "are you 21?" ANSWER
case "$ANSWER" in
  "yes")
    echo "i give u cookie";;
  "no")
    echo "that's illegal";;
  "are you?")
    echo "let's not";;
  *)
    echo "please answer"
esac

SHEEP=("one" "dos" "tre")
for S in ${SHEEP[@]}
do
  echo "$S sheep..."
done

n=0
for x in {1..10}
do
  n=$(expr $x + $n)
done
echo $n

# DON'T RUN THE FOLLOWING
while true
do
  echo "nightmare "
done

