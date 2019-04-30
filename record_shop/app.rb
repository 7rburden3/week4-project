require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/artist')
require_relative('models/record')
require_relative('models/genre')
require_relative('controllers/artists_controller')
require_relative('controllers/records_controller')
require_relative('controllers/genres_controller')
also_reload('./models/*')

# index
get '/index' do
  @records = Record.all()
  @artists = Artist.all()
  @genres = Genre.all()
  erb( :index )
end

# get '/index/:id' do
#   @records = Record.find(params['id'])
#   erb( :show )
# end
