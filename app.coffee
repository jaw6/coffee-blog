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

get '/posts/*', (id)->
	articleProvider.findById id, ((error, doc) =>
		@render 'posts_show.html.haml', {
			locals: {
				title: doc.title,
				article: doc
			}
		}
	)

post '/posts/*/comments/new', (id) ->
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