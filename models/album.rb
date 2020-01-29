require('pg')
require_relative('../db/sql_runner')

class Album

def initialize(options)
  @album_name = options['album_name']
  @genre = options['genre']
  @id = options['id'].to_i() if options['id']
  @artist_id = options['artist_id'].to_i() if options['artist_id']
end

end
