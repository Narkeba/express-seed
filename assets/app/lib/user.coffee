class User
	constructor: ->
		riot.observable @
		@joined window.user if window.user

	username: 'Guest'
	role: 'guest'
	isAuth: false

	login: (username, password) ->
		credential =
			identifier: username
			password: password

		request
			.post '/auth/local', credential
			.then @joined

	joined: (obj) =>
		_.assign @, obj
		@isAuth = true

		@trigger 'login'

	logout: ->
		request
			.get '/logout'
			.then @comeout

	comeout: (obj) =>
		@username = 'Guest'
		@role = 'guest'
		@isAuth = false

		@trigger 'logout'

module.exports = User
