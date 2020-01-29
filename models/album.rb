require('pg')
require_relative('../db/sql_runner')

class Album

  attr_reader :id,:artist_id
  attr_accessor :album_name,:genre

def initialize(options)
  @album_name = options['album_name']
  @genre = options['genre']
  @id = options['id'].to_i() if options['id']
  @artist_id = options['artist_id'].to_i() if options['artist_id']
end

def save()
sql= "INSERT INTO albums(
      album_name,genre,artist_id
      )
      VALUES (
        $1,$2,$3
        ) RETURNING id"
  values= [@album_name,@genre,@artist_id]
  results= SqlRunner.run(sql,values)
  @id=results[0]['id'].to_i()
end


end
