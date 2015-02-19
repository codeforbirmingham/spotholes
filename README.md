
sPotholes
========
[![Stories in Ready](https://badge.waffle.io/CodeforBirmingham/sPotholes.png?label=ready&title=Ready)](http://waffle.io/CodeforBirmingham/sPotholes)

This repository is for our sPotholes administrative backend, API, and web frontend.

Setting up local environment
========

####For image manipulation you will need to install imagemagick and libwebp.

######You can install imagemagick via homebrew:

    $brew install imagemagick
    
######Install libwebp via homebrew:

First update homebrew, then install libwebp:

    $brew update
    $brew install webp

######or install libwebp via macports:

First update macports, then install libwebp:

    $sudo port selfupdate
    $sudo port install webp
  
#### Set up the database (from within the sPotholes directory):

    $rake db:create
    $rake db:migrate

####We recommed using [POW] (http://pow.cx/) for the local server as it is pretty much configuration free.

Just do:

    $ curl get.pow.cx | sh
    
And then:

    $ cd ~/.pow
    $ ln -s /path/to/spotholes

That's it! Your application is now being served at: http://spotholes.dev
