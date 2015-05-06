BaseApi = require '../lib/baseApi'
reqFn = require.context './', false, /^\.\/.*\.coffee$/
apiPaths = reqFn.keys()
apis = {}

for path in apiPaths
	apiOptions = reqFn path
	name = path[2..][..-8]
	options =
		name: name

	_.assign apiOptions, options

	class Api extends BaseApi
		constructor: ->
			super apiOptions

	apis[name] = new Api

module.exports = apis
