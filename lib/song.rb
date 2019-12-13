require 'pry'
class Song 
  
  def initialize(title)
    @name = title
    @@all << self     
  end
  @@all =[]
  attr_accessor :name
  attr_reader :artist
  
  
  def artist=(name)
    
    @artist = name 
    @artist.add_song(self) unless @artist == self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(name)
    info = name.split(" - ")
    artist_name = Artist.find_or_create_by_name(info[0])
    song_name = info[1]
    new_song = Song.new(song_name)
    new_song.artist=(artist_name)
    new_song
  end
  
  def artist_name=(name)
   art = Artist.find_or_create_by_name(name)
   self.artist= art 
  end
end