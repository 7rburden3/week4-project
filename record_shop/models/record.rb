require_relative('../db/sql_runner')
require_relative('./artist.rb')
require_relative('./genre.rb')

class Record

  attr_accessor :id, :title, :artist_id, :quantity, :genre_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist_id = options['artist_id'].to_i
    @quantity = options['quantity'].to_i
    @genre_id = options['genre_id'].to_i
  end

  def record_title()
    return "#{@title}"
  end

  def save()
    sql = "INSERT INTO records
    (
      title,
      artist_id,
      quantity,
      genre_id
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@title, @artist_id, @quantity, @genre_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE records SET
    (
      title, artist_id, quantity
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4;"
      values = [@title, @artist_id, @quantity, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM records WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def get_artist()
      sql = "SELECT * FROM artists WHERE id = $1"
      values = [@artist_id]
      result = SqlRunner.run(sql, values)
      return Artist.map_items(result).first()
    end

    def stock_level()
      case @quantity
      when 1..4
        return "Stock level is low, reorder!"
      when 5..9
        return "Stock level is okay."
      else
        return "Stock level is too high, put on offer!"
      end
    end


    def self.delete_all()
      sql = "DELETE from records;"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM records"
      record_data = SqlRunner.run(sql)
      records = map_items(record_data)
      return records
    end

    def self.map_items(record_data)
      return record_data.map { |record| Record.new(record) }
    end

    def self.find(id)
      sql = "SELECT * FROM records
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      record = Record.new(result)
      return record
    end

  end # end class
