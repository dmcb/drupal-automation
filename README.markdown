# Drupal automation

* Automates Drupal behaviours

## Author

* [Derek McBurney](https://github.com/dmcb)


## Dependencies

* [CasperJS](http://casperjs.org) 1.04+
* [PhantomJS](http://phantomjs.org/) 1.98
* [Python](http://python.org/) 2.6+

## Installation

* Brew
	
		ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

* Casper

		brew install casperjs

* Python

		easy_install pip
		pip install openpyxl


## Configure

1. Copy config.sh.default to config.sh

		cp config.sh.default config.sh
		chmod 755 config.sh

2. Configure variables in config.sh

		export DRUPAL_URL=http://wcm.ucalgary.ca/
		export DRUPAL_USER=admin
		export DRUPAL_PASS=XXXXX
		
## Usage

* Run scripts

		. ./config.sh
		casperjs --ssl-protocol=any drupal-sign-on.coffee template