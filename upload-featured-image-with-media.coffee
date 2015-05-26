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
	@click '#edit-field-featured-image-blog-uofc a.button.launcher'
casper.then ->
	@waitUntilVisible 'iframe.media-modal-frame'
casper.then ->
	@captureSelector "screenshot.png", "html"
	@withFrame 1, ->
		@waitUntilVisible 'form#media-add-upload'
		casper.then -> 
			@fill 'form#media-add-upload',
				"files[upload]": casper.cli.args[2]
			, false
		casper.then ->
			@captureSelector "screenshot2.png", "html"
		casper.then ->
			@click 'form#media-add-upload #edit-submit'
casper.then ->
	@captureSelector "screenshot3.png", "html"
	@waitWhileVisible 'iframe.media-modal-frame'
casper.then ->
	@click '#edit-submit'

casper.run()