module.exports =
	script: 'server/server.coffee'
	ext: 'js coffee'
	ignore: [
		'assets/'
		'client/'
		'gulpfile.coffee'
		'node_modules'
	]
	env:
		'NODE_ENV': 'development'