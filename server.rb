require 'sinatra'
require 'sinatra-reloader'
require 'rubyjokes'

joke = RubyJoke.new

get '/' do
    erb :index
end

get '/' do
    'Hello World!'
end

get '/surprise' do
    @surprise_joke = joke.get_single_joke
    erb :surprise
end

get '/:type' do
    joke_type = params[:type]
    puts joke_type

    if joke_type == 'nerdy'
        @nerdy_joke = joke.get_joke({limitTo: ['nerdy']})
        erb :nerdy
    elsif joke_type == 'nsfw'
        @nsfw_joke = joke.get_joke({limitTo: ['explicit']})
        erb :nsfw
    else
        puts 'There is nothing here, dumbass! No joke.'
    end
end


