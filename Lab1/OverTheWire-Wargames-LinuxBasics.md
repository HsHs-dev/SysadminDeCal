First 15 Bandit Wargames from OverTheWire can be a good way to learn linux basics along with dealing with SSH
if you don't have an access to a remote machine.

Bandit Level 0: just connect to the game using SSH via command-line as following:
bandit0@bandit.labs.overthewire.org -p 2220
note that the flag -p is for specifying the port

with every level you just change the user name (bandit0, bandit1, bandit2.. etc)
==================================================================================================================
Bandit Level 0 → Level 1

When you login, list the files in the current directory using ls command, you will find readme file, display it using
cat command and you will see the password for next level.
password is: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
==================================================================================================================
Bandit Level 1 → Level 2

It's quite tricky here because the file name is a dash (-), and dashes has a special meaning for the shell,
so if you want to open the file you just write the full path of it; /home/banidt1/- with cat.
password is: 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
==================================================================================================================
Bandit Level 2 → Level 3
this is an easy one, spaces are special characters, so you just need to tell the shell to skip thim by putting
a backslash before each space; cat spaces\ in\ this\ filename
password is: MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
==================================================================================================================
Bandit Level 3 → Level 4

We can't keep our secret just out there, so we gonna keep them in hidden files, just cd to inhere directory and list the files with the flag -a which will list all files including hidden ones
ls -a
The file that we looking for is ...Hiding-From-You 
cat ...Hiding-From-You
password is: 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
==================================================================================================================
Bandit Level 4 → Level 5

The file command is a useful tool to let you know the type of the file, there is 8 files in inhere directory so we not going to search for them individually, instead we will use the file command with all the files in the directory using the * operator, which means 'all'. However the files starts with a dash, so we will do -- before the * operator which means 'don't consider the follwing as a flag' because all the file names starts with a dash
file -- *
file number 7 is ASCII text, so human readable
password is: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
==================================================================================================================
Bandit Level 5 → Level 6

In this level we just need to match a specific properties of a file using the magic command find, the file that we are looking for:
human-readable
1033 bytes in size
not executable

when we apply those properties using their flags we get ./maybehere07/.file2

find . -type f -size 1033c ! -executable

password is: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
==================================================================================================================
Bandit Level 6 → Level 7

Same as previous level, we are searching for a file with certain properies, but their is a tone of 'permission denied' that clutter the screen, so we will redirect them to garbage by 2>/dev/null which is like a black hole, and 2 is the code for stderr or standard error.

find / -user bandit7 -group bandit6 -size 33c 2>/dev/null

and we will get /var/lib/dpkg/info/bandit7.password

password is: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
==================================================================================================================
