
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

## Contributing

1. Fork it ( https://github.com/CodeforBirmingham/spotholes/fork )
2. Clone your fork
3. Add source repo as org (`git remote add org git@github.com:CodeforBirmingham/spotholes.git`)
4. Create your feature branch (`git checkout -b my-new-feature`)
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request

That's it! Your application is now being served at: http://spotholes.dev
