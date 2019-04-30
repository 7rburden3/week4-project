require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/record.rb')
require_relative('../models/artist.rb')
require_relative('../models/genre.rb')
also_reload( '../models/*' )

get '/records' do
  @records = Record.all()
  @artists = Artist.all()
  erb ( :"records/index" )
end

get '/records/new' do
  @artists = Artist.all()
  @records = Record.all()
  @genres = Genre.all()
  erb ( :"records/new")
end

get '/records/show/:id' do
  @records = Record.find(params['id'])
  erb ( :"records/show")
end

get '/records/:id' do
  @artists = Artist.all()
  @records = Record.find(params['id'])
  @genres= Genre.all()
  erb ( :"records/edit")
end

post '/records/show/delete' do
  record = Record.find(params['id'])
  record.delete
  redirect to '/records'
end

post '/records/:id' do
  record = Record.new(params)
  record.update
  redirect to '/records'
end

post '/records' do
  record = Record.new(params)
  record.save()
  redirect to '/records'
end

post '/records/:id/delete' do
  record = Record.find(params['id'])
  record.delete
  redirect to '/records'
end
