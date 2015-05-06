require 'coffee-script/register'

path = require 'path'
gulp = require 'gulp'
plugins = require('gulp-load-plugins')()
rimraf = require 'rimraf'
paths = require './config/paths.coffee'
webpackConfig = require './config/webpack.coffee'
nodemonConfig = require './config/nodemon.coffee'

src =
	app: path.join paths.assets, 'app/bootstrap.coffee'
	remove: paths.client
	copy: [
		path.join paths.assets, '**'
		path.join '!' + paths.assets, '{app,app/**}'
		path.join '!' + paths.assets, '{libs,libs/**}'
		path.join '!' + paths.assets, '{vendor,vendor/**}'
		path.join '!' + paths.assets, '{styles,styles/**}'
	]

dist =
	assets: paths.client
	copy: paths.client

watch =
	views: path.join paths.server, '/views/**/*.ejs'

gulp.task 'assets', ->
	gulp.src src.app
		.pipe plugins.webpack webpackConfig
		.pipe gulp.dest dist.assets
		.pipe plugins.livereload()

gulp.task 'tmp:copy', ->
	gulp.src src.copy
		.pipe gulp.dest dist.copy

gulp.task 'tmp:remove', (cb) ->
	rimraf src.remove, cb

gulp.task 'develop', ->
	plugins.livereload.listen()

	plugins.nodemon nodemonConfig
		.on 'restart', ->
			setTimeout ->
				plugins.livereload.changed __dirname

	gulp.watch watch.views, (e) ->
		plugins.livereload.changed e.path

gulp.task 'tmp', ['tmp:remove'], -> gulp.start 'tmp:copy'
gulp.task 'default', [
	'tmp'
	'develop'
	'assets'
]
gulp.task 'watch', ['default']
