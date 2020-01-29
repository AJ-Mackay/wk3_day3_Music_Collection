require ('pg')
require_relative('../db/sql_runner')


class Artist

attr_reader :id,:artist_name

def initialize(options)
  @id = options['id'].to_i if options['id']
  @artist_name = options['artist_name']
end

def save()
sql="INSERT INTO artists(artist_name)
VALUES($1) RETURNING id"
values=[@artist_name]
results=SqlRunner.run(sql,values)
@id=results[0]['id'].to_i
end

def albums()
  sql = "SELECT * FROM artists WHERE id = $1"
  values=[@id]
  results=SqlRunner.run(sql, values)
  return results.map {|album| Album.new(album)}
end

def self.delete_all()
  sql = "DELETE FROM artists"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM artists"
  artists=SqlRunner.run(sql)
  return artists.map {|artist| Artist.new(artist)}
end

end
