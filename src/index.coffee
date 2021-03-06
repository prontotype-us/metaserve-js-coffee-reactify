fs = require 'fs'
coffee_reactify = require 'coffee-reactify'
metaserve_js_browserify = require 'metaserve-js-browserify'
require('node-cjsx').transform()

VERBOSE = process.env.METASERVE_VERBOSE?

module.exports =
    ext: 'coffee'

    default_config:
        content_type: 'application/javascript'
        browserify:
            extensions: ['.coffee']
        browserify_shim: false

    compile: (filename, config, context, cb) ->
        console.log '[CoffeeReactifyCompiler.compile]', filename, config if VERBOSE

        config.beforeBundle = (bundler) ->
            bundler = bundler.transform(coffee_reactify)
            return bundler

        metaserve_js_browserify.compile filename, config, context, cb

