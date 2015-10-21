## Useless Key Generator

For when you want half of your key-pair and half of someone else's. [Live demo!](https://useless-keygen.herokuapp.com)

[RSA key-pairs](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) have two parts:

- A public key for encryption
- A private key for decryption

This app gives you mismatched pairs of freshly generated private keys plus old public keys of prior users.

This means that if a stranger somewhere posts an encrypted message using a public key somewhere online, and you happen to see it, and you bother to attempt to decrypt it, and it happens to actually use your key, then you could read it! Neat, huh?

Or you could be that guy who posts encrypted messages in strange places and hopes someone will actually read it, despite having no idea who the recipient might be. Heck, you won't even know if they saved the private key. Maybe no one can ever read your message! Ooo, such fun! :D

## Hackathon

This was made for LVL1's [Stupid Sh!t No-One Needs and Terrible Ideas Hackathon](http://www.lvl1.org/2015/10/05/this-weekend-the-stupid-hackathon/). So yes, it's SUPPOSED to be useless.

Feel free to file issues for ideas on how to make this even more useless.

## Setup

I deployed it on Heroku at https://useless-keygen.herokuapp.com, so you don't have to--but in case you do, keep reading... 

This is just a simple Ruby on Rails app whipped up in a few hours. It should be pretty straightforward, but here are some things to remember.

    $ bundle install
    $ rake db:create
    $ rake db:migrate
    $ rake assets:precompile

As usual, you can run it with

    $ rails serve
