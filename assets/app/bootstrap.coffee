require '../styles'

socket = require 'socket.io-client/socket.io'
App = require './app'
config = require './config'

io = socket()

window.app = new App
window.app.socket = io.socket

window.app.start()