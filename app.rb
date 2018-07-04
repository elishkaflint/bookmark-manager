require 'sinatra/base'
require 'sinatra/flash'

require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :new_bookmark
  end

  post '/bookmarks' do
    flash[:notice] = "Invalid URL" unless Bookmark.create(params[:add_url])
    redirect '/bookmarks'
  end

  get '/test_flash' do
    erb :test_flash
  end

  # check what this is
  run! if app_file == $0

end
