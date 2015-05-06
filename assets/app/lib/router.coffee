director = require 'director'

class Router extends director.Router
	constructor: (@_routes) ->
		riot.observable @

		parsed = @parseRoutes()

		super parsed

	parseRoutes: ->
		routes = {}
		for url of @_routes
			route = page = @_routes[url]
			actions = []

			if _.isObject route
				routes[url] = route
				continue

			if _.isArray route
				page = route.pop()
				actions.push route

			[pageTitle, pageName] = page.split ' '
			pageName = pageName || pageTitle
			actions.push @mouting pageName

			routes[url] = actions

		routes

	mouting: (pageName) ->
		->
			@trigger 'routeChange', pageName
			require "../pages/#{pageName}"
			riot.mount 'main', pageName

module.exports = Router
