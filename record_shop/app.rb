require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/artist')
require_relative('models/record')
also_reload('./models/*')

# index
get '/' do
  @records = Record.all()
  @artists = Artist.all()
  erb( :index )
end
