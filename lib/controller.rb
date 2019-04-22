require_relative "gossip"

class ApplicationController < Sinatra::Base

  # index
  get '/' do
    erb :index
  end

  # list page
  get '/gossips/all' do
    erb :gossip_list, locals: {gossips: Gossip.all}
  end

  # to create
  get '/gossips/new' do
    erb:new_gossips
  end

  # to create (reaction to formula)
  post '/gossips/new/' do
    Gossip.new(params['author'].capitalize, params['content'].capitalize).save
    redirect 'gossips/all'
  end

  # page of each gossip
  get '/gossips/:id' do
    id = params['id'].to_i
    erb :gossip_individual, locals:{id:id, gossip: Gossip.find(id)}
  end

  get '/gossips/:id/edit' do
    id = params['id'].to_i
    erb :edit, locals:{id:id, gossip: Gossip.find(id)}
  end

  post '/gossips/:id/edit' do
    id = params['id'].to_i
    Gossip.update(params['author'].capitalize, params['content'].capitalize, id)
    redirect '/gossips/all'
  end

end
