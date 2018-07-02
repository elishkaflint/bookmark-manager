require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Test environment is working"
  end

  # check what this is
  # run! if app_file == $PROGRAM_NAME

end
