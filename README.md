cryptnews
=========

Send encrypted newsletter readable only on your gpg subscribers. Ready on GNU/Linux and *nix!

PREREQUISITES
* mailx installed on the system
* gpg installed on the system
* create a file subscriber.list in your home directory
  with a list of contacts that have subscribed to your newsletter.
  The file must contain a list of emails in the form of
  
    jerk_boy@provider.com
    tonytony@provider.com
    bontony@provider.com
  
  and the emails must match the gpg keyring
  
  
README (Segue readme in italiano)
Cryptnews allow to make an encrypted newsletter.
After a key signing party, the ones who want to receive a secure news
subscribe to the newsletter, adding their email to the subscriber.list

Every news is encrypted with the public gpg key and sent to the subscriber.
This is not intended for a public newsletter (who wants encryption for a
public news?)

To start, you need the following requirements

mailx fully configured to send emails
gpg configured with the keys of the subscribers.
the subscriber.list file in your home directory, that contains a list of email addresses in the following form

indirizzo1@mail.boh
indirizzo2@mail.boh
indirizzoN@mail.boh

It’s important to leave an empty space at the end of the ~/subrscriber.list file and be sure the addresses match to the addresses used as id in gpg.

To send a newsletter use the following command
$ ./cryptnews.sh newsletterbody.txt "Subject of the newsletter"

LEGGIMI
CryptNews è uno script bash per l’invio di una newsletter cifrata con gpg.Dopo uno scambio di chiavi GPG avvenuto in un party o comunque in maniera sicura, si può utilizzare questo script per inviare una newsletter a ciascuno degli iscritti, cifrando la news stessa per ogni abbonato.
Per far questo si necessitano di 3 requisiti:
1) mailx installato e configurato per inviare email automaticamente
2)gpg installato e configurato con il portachiavi con tutte le public key degli abbonati alla newsletter
3)il file subscriber.list nella propria home directory che contiene una lista degli indirizzi email degli abbonati ed è nella forma

indirizzo1@mail.boh
indirizzo2@mail.boh
indirizzoN@mail.boh

È importante che il file subscriber.list contenga una linea vuota in fondo e che  gli indirizzi elencati nel file siano gli stessi usati come id nella cifratura con gpg.

Cryptnews si usa con questa sintassi
$ ./cryptnews.sh testonewsletter.txt "Oggetto della mail newsletter"

