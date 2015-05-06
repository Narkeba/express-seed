<private>
	<form onsubmit={ addPost }>
		<div class="field">
			<label for="">Название</label>
			<input type="text" name="title" >
		</div>
		<div class="field">
			<label for="">Текст</label>
			<textarea name="content"></textarea>
		</div>

		<button type="submit">Отправить</button>
	</form>

	<script>
		@addPost = (e) ->
			valid = @title.value isnt '' and @content.value isnt ''
			return unless valid
			post =
				title: @title.value
				content: @content.value

			app.api.post.create post, (data, jwres) ->
				console.log data, jwres

		app.socket.on 'post', console.log
	</script>
</private>
