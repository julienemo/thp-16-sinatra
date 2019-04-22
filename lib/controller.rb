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
    erb :gossip_individual, locals:{id:params['id'].to_i, gossip: Gossip.find(params['id'].to_i)}
  end

end
