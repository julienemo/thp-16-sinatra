require_relative "gossip"

class ApplicationController < Sinatra::Base
  get '/' do
    erb:index
  end

  get '/gossips/new' do
    erb:new_gossips
  end

  post '/gossips/new/' do
    Gossip.new("Salut", "sa va").save
  end

end
