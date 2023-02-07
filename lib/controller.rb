require 'article'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {articles: Article.all}
  end

  get '/articles/new' do
    erb :new_article
  end

  post '/articles/new/' do
    Article.new(params["article_author"], params["article_content"]).save
    redirect '/'
=begin
    puts "On server/terminal"
    puts "Hash : #{params}"
    puts "article_author : #{params["article_author"]}"
    puts "article_content : #{params["article_content"]}"
=end
  end

  get '/articles/:id' do
    erb :show, locals: {article: Article.find(params["id"])}
  end

  get '/articles/:id/edit/' do
    erb :edit, locals: {article: Article.find(params["id"])}
  end

  post '/articles/:id/edit/' do
    Article.update(params["article_author"], params["article_content"])
    redirect "/"
  end

end