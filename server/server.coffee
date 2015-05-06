express = require 'express'
path = require 'path'
paths = require '../config/paths'

configLib = path.join paths.lib, 'config.coffee'
globalLib = path.join paths.lib, 'global.coffee'

require globalLib

app = express()
app.config = require configLib

server = app.listen app.config.express.port, app.config.express.host, ->
	host = server.address().address
	port = server.address().port
	console.log 'Example app listening at http://%s:%s', host, port