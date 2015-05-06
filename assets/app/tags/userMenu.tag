<user-menu>
    { app.user.username }
	<a onclick={ logout }>Выйти</a>

    <script>
		@logout = ->
			app.user.logout()
    </script>
</user-menu>
