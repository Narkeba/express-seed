path = require 'path'
rootDir = path.join __dirname, '../'

module.exports =
	assets: path.join rootDir, 'assets'
	client: path.join rootDir, 'client'
	server: path.join rootDir, 'server'
	config: path.join rootDir, 'config'
	shared: path.join rootDir, 'shared'
	lib: path.join rootDir, 'lib'

	bower: path.join rootDir, 'assets/vendor'
