require_relative('../db/sql_runner')
require_relative('./artist.rb')

class Record

  attr_reader :id, :title, :artist_id
  attr_accessor :quantity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist_id = options['artist_id'].to_i
    @quantity = options['quantity'].to_i
  end

  def save()
    sql = "INSERT INTO records
    (
      title,
      artist_id,
      quantity
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@title, @artist_id, @quantity]
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
    sql = "SELECT * FROM students
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    record = Record.new(result)
    return record
  end

end # end class
