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
    # pass the value to a var
    # so that later my codes be shorter. yeah!
    # :id is by default string !!!
    # very important this .to_i
    id = params['id'].to_i
    erb :gossip_individual, locals:{id:id, gossip: Gossip.find(id)}
  end

  # to edit an existing gossip
  get '/gossips/:id/edit' do
    id = params['id'].to_i
    erb :edit, locals:{id:id, gossip: Gossip.find(id)}
  end

  # to edit: reaction after submitting the fomula
  post '/gossips/:id/edit' do
    id = params['id'].to_i
    Gossip.update(params['author'].capitalize, params['content'].capitalize, id)
    redirect '/gossips/all'
  end

end
