express = require 'express'
path = require 'path'
paths = require '../config/paths'
restource = require path.join paths.lib, 'resturce.coffee'

app = express()
app.config = restource.config

server = app.listen app.config.express.port, app.config.express.host, ->
	host = server.address().address
	port = server.address().port
	console.log 'Example app listening at http://%s:%s', host, port