<nav>
	<ul>
		<li each={ route, page in app.router._routes } class={ acitve: app.currentPage == page }>
			<a onclick={ parent.routeTo }>{ parent.title(this) }</a>
		</li>
	</ul>

	<script>
		app.router.on 'routeChange', =>
			@update()

		@routeTo = (e) ->
			route = e.item
			app.router.setRoute route.route

		@title = (page) ->
			[pageTitle, pageView] = page.page.split ' '
			pageTitle

	</script>
</nav>
