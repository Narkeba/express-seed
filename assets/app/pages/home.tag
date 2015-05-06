<home>
	<h3>Посты</h3>
	<div each={ posts }>
		<h4>{ title }</h4>
		<article>{ content }</article>
		<button onclick={ parent.delete }>Remove</button>
	</div>

	<script>
		app.api.post.all sort: 'createdAt desc', (data, jwres) =>
			@posts = data
			@update()

		@delete = (e) ->
			post = e.item
			app.api.post.delete post.id, (data, jwres) =>
				console.log data
	</script>
</home>
