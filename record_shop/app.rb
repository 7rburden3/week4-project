require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/artist')
require_relative('models/record')
also_reload('./models/*')

# index
get '/index' do
  @records = Record.all()
  @artists = Artist.all()
  erb( :index )
end

# get '/index/:id' do
#   @records = Record.find(params['id'])
#   erb( :show )
# end
