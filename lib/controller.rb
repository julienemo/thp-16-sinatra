require_relative "gossip"

class ApplicationController < Sinatra::Base

<<<<<<< HEAD
=======
  # index
>>>>>>> julie
  get '/' do
    erb :index
  end

  # list page
  get '/gossips/all' do
    erb :gossip_list, locals: {gossips: Gossip.all}
  end


  get '/gossips/new' do
    erb:new_gossips
  end

  post '/gossips/new/' do
    Gossip.new(params['author'].capitalize, params['content'].capitalize).save
    redirect '/'
  end

  post '/gossip/:id' do
    erb :gossip_individual, locals:{id:params['id'].to_i, gossip:Gossip.find(params['id'].to_i)}
  end

end
