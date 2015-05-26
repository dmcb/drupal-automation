drupal = require('drupal')
pathutils = require('pathutils')

casper = new drupal.Drupal

if casper.cli.args.length is 0
	casper
		.echo("Usage: $ casperjs drupal-sign-on.coffee [site]")
		.exit(1)

# Start Casper and log in to Drupal
casper.startDrupal()

casper.then ->
	@captureSelector "screenshot.png", "html"

casper.run()