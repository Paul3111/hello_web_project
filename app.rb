require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
    # This allows the app code to refresh
    # without having to restart the server.
    configure :development do
      register Sinatra::Reloader
    end

    post '/submit' do
      name = params[:name]
      message = params[:message]  
      return "Thanks #{name}, you sent this message: '#{message}'"
    end
  end