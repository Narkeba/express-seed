require('../tags/userMenu')
require('../tags/login')
require('../tags/nav')

<header>
	<div class="container nav">
		<nav></nav>
		<user-menu if={ app.user.isAuth }></user-menu>
		<login if={ !app.user.isAuth }></login>
	</div>

	<script>
		app.user.on 'logout login', =>
			@update()

		riot.mount 'user-menu, login'
    </script>
</header>
