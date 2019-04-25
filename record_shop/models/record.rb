require_relative('../db/sql_runner')

class Record

  attr_reader :id, :title, :artist_id
  attr_accessor :quantity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist_id = options['artist_id'].to_i
    @quantity = options['quantity'].to_i
  end

  


end # end class
