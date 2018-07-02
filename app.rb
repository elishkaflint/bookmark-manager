require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmark = Bookmark.new
    erb :bookmarks
  end




  # check what this is
  run! if app_file == $0

end
