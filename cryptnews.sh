#! /bin/bash

#CryptNews  Copyright (C) 2013  Giovanni Santostefano
#This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
#This is free software, and you are welcome to redistribute it
#under certain conditions; type `show c' for details.

#Cryptnews allow to make an encrypted newsletter.
#After a key signing party, the ones who want to receive a secure news 
#subscribe to the newsletter, adding their email to the subscriber.list
#
#Every news is encrypted with the public gpg key and sent to the subscriber.
#This is not intended for a public newsletter (who wants encryption for a 
#public news?)
#
#To start, you need the following requirements
#
# mailx fully configured to send emails
# gpg configured with the keys of the subscribers.
# the subscriber.list file that contains a list of email addresses

SUB_LIST=~/subscriber.list

clear
echo "Cryptnews"
echo "A script for gpg encrypted newsletter"
echo "by Giovanni Santostefano"
echo "http://letteredalcyberspazio.wordpress.com"
echo
echo

#test for mailx installation
if [ -e "/usr/bin/mailx" ]
then
 echo "mailx installed!"
else
 if [ -e "/bin/mailx" ]
 then
  echo "mailx installed!"
 else
  echo
  echo
  echo "ERROR!!!"
  echo "Please, install and configure mailx on your client"
  exit 1
 fi
fi

#test for gpg installation
if [ -e "/usr/bin/gpg" ]
then
 echo "gpg installed!"
else
 if [ -e "/bin/gpg" ]
 then
  echo "gpg installed!"
 else
  echo
  echo
  echo "ERROR!!!"
  echo "Please, install and configure GPG on your client"
  exit 2
 fi
fi

#test for subscriber.list
if [ -e "${SUB_LIST}" ]
then
 echo "Subscriber list checked!"
else
 echo
 echo
 echo "ERROR!!!"
 echo "Please build a subscriber.list file in your home directory"
 echo "subscriber.list is a txt list of email address followed by and empty line"
 echo "Each email address must match to the gpg public key address of the subscriber"
 echo 
 exit 3
fi

#test for newsletter
if [ -e "$1" ]
then
 echo "newsletter checked!"
else
 echo
 echo
 echo "ERROR!!!"
 echo "Please give the newsletter as argument"
 echo "Usage: cryptnews.sh newsletter.txt \"Subject of the newsletter\""
 exit 4
fi

#test for subject
if [ -z "$2" ]
then
 echo
 echo
 echo "ERROR!!!"
 echo "Please give the newsletter subject as argument"
 echo "Usage: cryptnews.sh newsletter.txt \"Subject of the newsletter\""
 exit 5
fi


#start newsletter sending
clear
echo "Cryptnews"
echo "A script for gpg encrypted newsletter"
echo "by Giovanni Santostefano"
echo "http://letteredalcyberspazio.wordpress.com"
echo
echo


while read addrline
do
 echo "Encrypting newsletter for $addrline"
 gpg --armor --output /tmp/encnewsletter.asc  --encrypt --recipient $addrline $1
 if [ $? -ne 0 ] 
 then
  echo "error with gpg"
  exit 6
 fi
 
 echo "Sending encrypted newsletter to: $addrline"
 mailx -s "$2" $addrline < /tmp/encnewsletter.asc
 if [ $? -ne 0 ] 
 then
  echo "error with mailx"
  exit 7
 fi
 
 
 echo "Removing temporary encrypted newsletter"
 rm /tmp/encnewsletter.asc
 if [ $? -ne 0 ] 
 then
  echo "error with rm... continuing!"
 fi
done < $SUB_LIST