require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/record.rb')
# require_relative('../models/artist.rb')
also_reload( '../models/*' )

get '/records' do
  @records = Record.all()
  @artists = Artist.all()
  erb ( :"records/index" )
end

get '/records/add' do
  @artists = Artist.all()
  @records = Record.all()
  erb ( :"records/add")
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
