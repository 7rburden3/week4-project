require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/record.rb')
require_relative('../models/genre.rb')
also_reload( '../models/*' )

get '/genres' do
  @genre = Genre.all()
  erb ( :"genres/new" )
end

post '/genres' do
  genre = Genre.new(params)
  genre.save()
  redirect to '/genres'
end

post '/genres/:id/delete' do
  genre = Genre.find(params['id'])
  genre.delete
  redirect to '/genres'
end
