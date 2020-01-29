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

def self.delete_all()
  sql = "DELETE FROM artists"
  SqlRunner.run(sql)
end


end
