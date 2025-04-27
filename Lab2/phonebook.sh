#!/bin/bash

# This a simple phonebook script that does the following:

# ./phonebook new <name> <number> adds an entry to the phonebook. Don’t worry about duplicates (always add a new entry, even if the name is the same).

# ./phonebook list displays every entry in the phonebook (in no particular order). If the phonebook has no entries, display phonebook is empty

# ./phonebook remove <name> deletes all entries associated with that name. Do nothing if that name is not in the phonebook.

# ./phonebook clear deletes the entire phonebook.

# ./phonebook lookup <name> displays all phone number(s) associated with that name.
# You can assume all phone numbers are in the form ddd-ddd-dddd where d is a digit from 0-9.

# Global variables
NAME=$2
NUMBER=$3

# Helper functions

# check if phonebook.txt exists
check_exist() {
  if [ ! -e "phonebook.txt" ]; then
    echo "You have to create a phonebook first. Try ./phonebook.sh add <name> <number>"
    exit 1
  fi
}


# Adds an entry to the phonebook
new()
{

# check if there is a phonebook.txt file (where phone book data are stored), if not, create it.
FILES=(*.txt)

NOT_FOUND=0
for FILE in "${FILES[@]}";
do
  if [ "$FILE" = "phonebook.txt" ]; then 
    NOT_FOUND=1
  fi
done

if [ $NOT_FOUND -eq 0 ]; then
  touch "phonebook.txt"
fi  

# Check if the user didn't provide a name or a number

if [ -z "$NAME" ]; then
  echo -e "\e[31mPlease provide a name\nusage: ./phonebook new <name> <number>\e[0m"
  exit 1
fi

if [ -z "$NUMBER" ]; then
  echo -e "\e[31mPlease provide a number\nusage: ./phonebook new <name> <number>\e[0m"
  exit 1
fi


# Adds the entry (name number) to the phonebook
echo "$NAME $NUMBER" >> "phonebook.txt"

}

# Displays every entry in the phonebook
list()
{

  # check if phonebook.txt exists
  check_exist

  # check if phonebook.txt is empty, display a message, otherwise display the phonebook
  if [ ! -s "phonebook.txt" ]; then
    echo -e "\e[33mphonebook is empty\e[0m"
  else
    cat "phonebook.txt";
  fi

}

# remove <name> deletes all entries associated with that name.
remove()
{

  # check if phonebook.txt exists
  check_exist

  if [ "$(grep -c "$NAME" "phonebook.txt")" -eq 0 ]; then
    echo -e "\e[31m$NAME\e[0m is not found."
    exit 1
  fi

  # delete every line that matches the name
  sed -i "/$NAME/d" "phonebook.txt"

}

# Deletes the entire phonebook.
clear()
{

  # check if phonebook.txt exists
  check_exist

  # clear the whole phonebook
  > "phonebook.txt"

}

# displays all phone number(s) associated with the specified name
lookup()
{

  # check if phonebook.txt exists
  check_exist

  # check if the user provided a name
  if [ -z "$NAME" ]; then
  echo -e "\e[31mPlease provide a name\nusage: ./phonebook lookup <name>\e[0m"
  exit 1
  fi

  # check if the name exists in phonebook.txt
  if [ "$(grep -c "$NAME" "phonebook.txt")" -eq 0 ]; then
    echo -e "\e[31mName doesn't match any number\e[0m"
    exit 1
  fi

  # print all the numbers asscoiated with a specified name
  grep "$NAME" "phonebook.txt" | sed "s/.*$NAME//" | sed "s/^[[:space:]]//"

}


# STARTING POINT OF THE SCRIPT
# checks the entered command
case "$1" in
  "new")
    new;;

  "list")
    list;;

  "remove")
    remove;;

  "clear")
    clear;;

  "lookup")
    lookup;;

  "usage")
    echo -e "\e[36mThis is a simple phonebook script that does the following:\e[0m

    \e[32m./phonebook new <name> <number>\e[0m
    Adds an entry to the phonebook.

    \e[32m./phonebook list\e[0m
    Displays every entry in the phonebook (in no particular order). If the phonebook has no entries, display \e[33mphonebook is empty\e[0m.

    \e[32m./phonebook remove <name>\e[0m
    Deletes all entries associated with that name. Do nothing if that name is not in the phonebook.

    \e[32m./phonebook clear\e[0m
    Deletes the entire phonebook.

    \e[32m./phonebook lookup <name>\e[0m
    Displays all phone number(s) associated with that name.
    You can assume all phone numbers are in the form \e[35mddd-ddd-dddd\e[0m where d is a digit from 0-9."
    ;;

  *)
    echo "Please enter a valid command, try ./phonebook.sh usage"
esac
