kiwi: require 'kiwi'
kiwi.require 'express'
require 'express/plugins'
kiwi.seed 'mongodb-native'

ArticleProvider = require('./articleprovider-mongodb').ArticleProvider
articleProvider: new ArticleProvider 'localhost', 27017

sys: require 'sys'

configure ->
  use MethodOverride
  use ContentLength
  use Cookie
  use Session
  use Flash
  use Logger
  use Static
  set 'root', __dirname

get '/', ->
  @redirect('/posts')

get '/posts', ->
	articleProvider.findAll ((error, docs) =>
		@render 'posts_index.html.haml', {
			locals: {
				title: 'My blog',
				articles: docs
			}
		}
	)

get '/posts.json', ->
	articleProvider.findAll ((error, docs) =>
		@contentType 'json'
		@halt 200, JSON.stringify(docs.map ((article) ->
			{post: {id: article._id.toHexString(), title: article.title, body: article.body} }
		))
	)

get '/posts/new', ->
	@render 'posts_new.html.haml', {
		locals: {
			title: 'New Post'
		}
	}

post '/posts/new', ->
	articleProvider.save {
		title: @param('title'),
		body: @param('body')
	}, ((error, docs) =>
		@redirect '/posts'
	)

post '/posts.json', ->
	# decoded: JSON.decode(@body)
	# sys.puts JSON.decode(@body).post
	post: JSON.decode(@body).post
	articleProvider.save {
		title: post.title,
		body: post.body
	}, ((error, docs) =>
		@halt 200, 'OK'
	)

get '/posts/*', (id)->
	articleProvider.findById id, ((error, doc) =>
		@render 'posts_show.html.haml', {
			locals: {
				title: doc.title,
				article: doc
			}
		}
	)

post '/posts/:id/delete', (id)->
	articleProvider.findAndDestroy id, ((error, doc) =>
		if(error) 
			@halt 503, "Didn't work"
		else 
			@redirect '/posts'
	)

put '/posts/:id.json', (id)->
	data: JSON.decode(@body).post
	articleProvider.update id, data, ((error, doc) =>
		if(error)
			@halt 503, 'Update failed'
		else
			@halt 200, 'OK'
	)

del '/posts/:id.json', (id)->
	articleProvider.findAndDestroy id, ((error, doc) =>
		if(error)
			@halt 503, "Didn't work"
		else
			@halt 200, 'OK'
	)


post '/posts/:id/comments/new', (id) ->
	data = {
		person: @param('person'),
		comment: @param('comment')
	}
	articleProvider.addCommentToArticle id, data, ((error, doc) =>
		@redirect "/posts/${id}"
	)

get '/*.css', (file)->
	@render "sass/${file}.css.sass", {layout: false}

run()