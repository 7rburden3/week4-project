require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/artist')

get '/artists' do
  @artists = Artist.all()
  erb ( :"artists/add")
end

get '/artists' do
  @artists = Artist.all()
  @records = Record.all()
  erb ( :"artists/add")
end

post '/artists' do
  artist = Artist.new(params)
  artist.save()
  redirect to '/artists'
end

post 'artists/:id/delete' do
  artist = Artist.find(params['id'])
  artist.delete
  redirect to '/artists'
end
