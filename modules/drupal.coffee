casper = require('casper')
system = require('system')
utils = require('utils')
pathutils = require('pathutils')

exports.Drupal = 

	class Drupal extends casper.Casper

		constructor: (options) ->
			super
				verbose: true
				logLevel: "debug"
			
			# Constructor portal URL

			drupalApplicationURL = pathutils.appendPathComponent system.env.DRUPAL_URL, @cli.args[0]

			@options = utils.mergeObjects
				drupalApplicationURL: drupalApplicationURL
				drupalLoginURL: pathutils.appendPathComponent drupalApplicationURL, 'user'
				drupalUserID: system.env.DRUPAL_USER
				drupalPwd: system.env.DRUPAL_PASS
				pageSettings:
					userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.29.13 (KHTML, like Gecko) Version/6.0.4 Safari/536.29.13"
				viewportSize:
					width: 1024
					height: 768
			, @options

		startDrupal: ->
			@start @options.drupalLoginURL, ->
				@captureSelector "screenshot.png", "html"
				@waitUntilVisible 'li.uncas-link'
				@then ->
					@click 'li.uncas-link'
				@then ->
					@fill "form#user-login",
						name: @options.drupalUserID
						pass: @options.drupalPwd
					, false
				@then ->
					@click 'input#edit-submit'