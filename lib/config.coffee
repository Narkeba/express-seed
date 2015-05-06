glob = require 'glob'
path = require 'path'
paths = require '../config/paths'

pattern = path.join paths.config, '*.coffee'
patternEnv = path.join paths.config, '/env/', '*.coffee'

configs = {}

configsPaths = glob.sync pattern
EnvsPaths = glob.sync patternEnv

for configPath in configsPaths
	configName = path.basename configPath, '.coffee'
	config = require configPath
	configs[configName] = config

for envPath in EnvsPaths
	envName = path.basename envPath, '.coffee'
	continue unless process.env.NODE_ENV is envName

	env = require envPath
	_.assign configs, env

module.exports = configs
