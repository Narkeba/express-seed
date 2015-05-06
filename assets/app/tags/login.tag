<login>
	<form onsubmit={ login }>
		<input type="text" value="dordevic" name="identifier" />
		<input type="text" value="hello123" name="password" />
		<button type="submit" name="button">Войти</button>
	</form>

	<script>
		@login = ->
			identifier = @identifier.value
			password = @password.value

			app.user.login identifier, password
	</script>
</login>
