require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  def initialize(song_name)
    @name = song_name
  end

  def self.new_by_filename(file_name)
    name_array = file_name.split(" - ")
    new_song = Song.new(name_array[1])
    new_song.genre= name_array[2].chomp(".mp3")
    new_song.artist = Artist.find_or_create_by_name(name_array[0])
    new_song.artist.add_song(name_array[1])
    new_song
  end
end