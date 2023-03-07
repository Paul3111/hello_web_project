require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
    # This allows the app code to refresh
    # without having to restart the server.
    configure :development do
      register Sinatra::Reloader
    end

    get '/play' do
        name = params[:name]
        fav_sports = params[:fav_sports]
        city = params[:city]
        return "Hi #{name}! Thanks for letting us know that you live
            in #{city} and you like playing #{fav_sports}!"
    end

    post '/submit' do
      name = params[:name]
      message = params[:message]  
      return "Thanks #{name}, you sent this message: '#{message}'"
    end

    post '/sort-names' do
      names = params[:names]
      names_array = names.split(",").sort
      result = names_array.join(",")
      return result
    end
end