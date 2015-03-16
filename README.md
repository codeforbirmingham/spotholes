
# sPotholes

[![Stories in Ready](https://badge.waffle.io/CodeforBirmingham/sPotholes.png?label=ready&title=Ready)](http://waffle.io/CodeforBirmingham/sPotholes)

This repository is for our sPotholes administrative backend, API, and web frontend.

## Setup

This project expects you to at least have Ruby 2.1+ and Homebrew installed.

After you clone the repo, navigate to spotholes directory and run:

    ./bin/setup

This will walk you through the setup of the tools for the project for Mac OS X and Homebrew. Additional platform setup scripts/updates are welcome.

## Dependencies

sPotholes uses the following tools/libraries outside of the gem bundle.

* imagemagick (v6.8.9)
* libwebp (v0.4.2)
* [node.js](https://nodejs.org/) (v0.12) - This includes npm
* bower (v1.3.12) - installed via npm
  `(sudo) npm install -g bower`

sPotholes uses Google Maps Embed API and requires a browser key to function.
This can be obtained by following [these instructions](https://developers.google.com/maps/documentation/embed/guide#api_key).
You'll need an app and enable Google Maps Embed API for said app. Then use the
credentials section of APIs & auth, to create a Public API access key. The
browser version.

## Manually Setting Up Local Environment

For image manipulation you will need to install imagemagick and libwebp.

### You can install imagemagick and libwebp via homebrew:

    brew install imagemagick
    brew install webp

_Note: If either package is not available, you may need to update homebrew._
    brew update
    
### Alternate Install libwebp via macports:

First update macports, then install libwebp:

    sudo port selfupdate
    sudo port install webp
  
### Install node.js and bower

    brew install node
    npm install -g bower

### Get web components
    bower install

### Set up the database (from within the sPotholes directory):

    rake db:create
    rake db:migrate

####We recommed using [POW] (http://pow.cx/) for the local server as it is pretty much configuration free.

Just do:

    curl get.pow.cx | sh
    
And then:

    cd ~/.pow
    ln -s /path/to/spotholes
    
That's it! Your application is now being served at: http://spotholes.dev

## Contributing

1. Fork it ( https://github.com/CodeforBirmingham/spotholes/fork )
2. Clone your fork
3. Add source repo as org (`git remote add org git@github.com:CodeforBirmingham/spotholes.git`)
4. Create your feature branch (`git checkout -b my-new-feature`)
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request
