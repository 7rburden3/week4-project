require_relative("../models/record.rb")
require_relative("../models/artist.rb")
require("pry-byebug")

Record.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Rush'})
artist2 = Artist.new({'name' => 'ACDC'})

artist1.save
artist2.save

record1 = Record.new({
  'title' => '2112',
  'artist_id' => artist1.id,
  'quantity' => 5,
  'genre' => 'rock'
  })

record2 = Record.new({
  'title' => 'Moving Pictures',
  'artist_id' => artist1.id,
  'quantity' => 6,
  'genre' => 'rock'
  })

record3 = Record.new({
  'title' => 'Back in Black',
  'artist_id' => artist2.id,
  'quantity' => 3,
  'genre' => 'rock'
  })

record4 = Record.new({
  'title' => 'For Those About to Rock',
  'artist_id' => artist2.id,
  'quantity' => 7,
  'genre' => 'rock'
  })

record1.save
record2.save
record3.save
record4.save

# record3.delete
# record4.delete

# artist2.delete
