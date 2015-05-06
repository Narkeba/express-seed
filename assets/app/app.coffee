apiLoader = require './lib/apiLoader'
Router = require './lib/router'
User = require './lib/user'
routes = require './routes'
config = require './config'

class App
	constructor: ->
		riot.observable @
		riot.route.stop()

	start: ->
		@api = apiLoader

		@user = new User

		@router = new Router routes
		@router.configure config.router

		@router.on 'routeChange', (pageName) =>
			@currentPage = pageName

		@router.init '/'

		require './partials/header.tag'
		require './partials/footer.tag'
		riot.mount 'header, footer'

module.exports = App
