require_relative("../models/record.rb")
require_relative("../models/artist.rb")
require_relative("../models/genre.rb")
require("pry-byebug")

Record.delete_all()
Genre.delete_all()
Artist.delete_all()


artist1 = Artist.new({'name' => 'Rush'})
artist2 = Artist.new({'name' => 'ACDC'})

artist1.save
artist2.save

genre1 = Genre.new({'genre' => 'Rock'})
genre2 = Genre.new({'genre' => 'Metal'})

genre1.save
genre2.save

record1 = Record.new({
  'title' => '2112',
  'artist_id' => artist1.id,
  'quantity' => 5,
  'genre_id' => genre1.id
  })

  record2 = Record.new({
    'title' => 'Moving Pictures',
    'artist_id' => artist1.id,
    'quantity' => 6,
    'genre_id' => genre1.id
    })

    record3 = Record.new({
      'title' => 'Back in Black',
      'artist_id' => artist2.id,
      'quantity' => 3,
      'genre_id' => genre1.id
      })

      record4 = Record.new({
        'title' => 'For Those About to Rock',
        'artist_id' => artist2.id,
        'quantity' => 7,
        'genre_id' => genre1.id
        })

        record1.save
        record2.save
        record3.save
        record4.save

        # record3.delete
        # record4.delete

        # artist2.delete
