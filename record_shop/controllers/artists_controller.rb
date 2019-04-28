require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/record.rb')
also_reload( '../models/*' )

get '/artists' do
  @artists = Artist.all()
  erb ( :"artists/index" )
end

get '/artists/add' do
  @artists = Artist.all()
  @records = Record.all()
  erb ( :"artists/add")
end

get '/artists/:id' do
  @artists = Artist.find(params['id'])
  @records = Record.all()
  erb( :"artists/show" )
end

post '/artists' do
  artist = Artist.new(params)
  artist.save()
  redirect to '/artists'
end

post '/artists/:id/delete' do
  artist = Artist.find(params['id'])
  artist.delete
  redirect to '/artists'
end
