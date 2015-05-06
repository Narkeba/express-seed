path = require 'path'
paths = require './paths'
webpack = require 'webpack'
ExtractTextPlugin = require 'extract-text-webpack-plugin'
autoprefixer = require 'autoprefixer-stylus'
axis = require 'axis'
jeet = require 'jeet'

module.exports =
	watch: true
	devtool: '#source-map'
	output:
		filename: 'bundle.js'
	resolve:
		root: paths.bower
		extensions: ['', '.js', '.coffee', '.styl', '.tag']
	plugins: [
		new webpack.ResolverPlugin (
			new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin 'bower.json', ['main']
		)

		new webpack.ProvidePlugin
			'_': 'lodash'
			'riot': 'riot'
			'request': 'qwest'

		new ExtractTextPlugin 'style.css',
			allChunks: true
	]
	module:
		loaders: [
			{ test: /\.tag/, loader: 'tag?type=cs' }
			{ test: /\.coffee$/, loader: 'coffee-loader' }
			{ test: /\.styl$/, loader: ExtractTextPlugin.extract 'style-loader', 'css-loader!stylus-loader' }
		]
	stylus:
		use: [
			autoprefixer
				browsers: ['ie 7', 'ie 8']
			axis()
			jeet()
		]
		import: [
			'axis'
			'jeet'
		]
