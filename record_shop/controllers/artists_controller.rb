require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/record.rb')
also_reload( '../models/*' )

get '/index' do
  erb ( :index )
end

get '/artists' do
  @artists = Artist.all()
  erb ( :"artists/index" )
end

get '/artists/new' do
  @artists = Artist.all()
  @records = Record.all()
  erb ( :"artists/new")
end

get '/artists/:id' do
  @artists = Artist.find(params['id'])
  @records = Record.all()
  erb( :"artists/show" )
end

get '/artists/:id/destroy' do
  @artist = Artist.find(params['id'])
  erb(:"artists/destroy")
end

get '/artists/:id/edit' do
  @artist = Artist.find(params['id'])
  erb( :"artists/edit")
end

post '/artists' do
  artist = Artist.new(params)
  artist.save()
  redirect to '/artists/new'
end

post '/artists/:id' do
  artist = Artist.new(params)
  artist.update
  redirect to '/artists'
end

post '/artists/:id/delete' do
  artist = Artist.find(params['id'])
  artist.delete
  redirect to '/artists'
end
