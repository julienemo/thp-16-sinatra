require_relative "gossip"

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new' do
    erb:new_gossips
  end

  post '/gossips/new/' do
    Gossip.new(params['author'].capitalize, params['content'].capitalize).save
    redirect '/'
  end

end
