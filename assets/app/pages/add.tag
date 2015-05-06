<add>
	<button type="button" onclick={ test }>TEST</button>

	<script>
		app.socket.on 'privet!', (e) ->
			console.log e
		@test = (e) ->
			app.socket.get '/private', (data, jwres) ->
				console.log data, jwres
	</script>
</add>
