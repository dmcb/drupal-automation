drupal = require('drupal')
pathutils = require('pathutils')

casper = new drupal.Drupal

if casper.cli.args.length is 0
	casper
		.echo("Usage: $ casperjs upload-featured-image.coffee [site] [blogpath] [file-to-upload]")
		.exit(1)

# Start Casper and log in to Drupal
casper.startDrupal()

casper.then ->
	@open pathutils.appendPathComponent casper.options.drupalApplicationURL, casper.cli.args[1] + "/edit"
casper.then ->
	@waitUntilVisible 'form#blog-node-form'
casper.then -> 
	@fill '#blog-node-form',
		"files[field_featured_image_blog_uofc_und_0]": casper.cli.args[2]
	, true
casper.then ->
	@captureSelector "screenshot.png", "html"
casper.then ->
	@click '#edit-submit'

casper.run()