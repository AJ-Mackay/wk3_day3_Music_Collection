require('pry')
require_relative("../models/album")
require_relative("../models/artist")

artist1=Artist.new({
  'artist_name' => 'Red Hot Chilli Peppers'
  })

artist1.save

  album1=Album.new({
  'album_name' => 'Californication',
  'genre' => 'Alt Rock',
  'artist_id'=> artist1.id
    })

album1.save

binding.pry
nil
