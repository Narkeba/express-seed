store = require 'store-js'

class BaseApi
	constructor: (options) ->
		riot.observable @

		@name = options.name
		@subscribed = false

	all: (options, cb) =>
		options = options || {}

		if @subscribed
			local = store.get @name
			return cb local if local

		app.socket.get "/api/#{@name}", options, (res, jwres) =>
			if jwres.statusCode is 200
				store.set @name, res
				@subscribe()

			cb res, jwres

	subscribe: =>
		@subscribed = true

		app.socket.on @name, (e) =>
			@verbs e.verb

	verbs: (verb) =>
		console.log verb
		verbs =
			create: ->
				models = store.get @name
				models.push e.data
				store.set @name, models

		verbs[verb]()

	create: (data, cb) =>
		app.socket.post "/api/#{@name}", data, cb

	delete: (id, cb) =>
		app.socket.delete "/api/#{@name}/#{id}", cb

module.exports = BaseApi
