require 'pry'
class Artist 

    @@all = []
  @@songs = []

  def initialize(name)
    @name = name 
    @@all << self 
  end
  
  
  attr_accessor :name 
  
  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self 
    @@songs << song 
  end
  
  def songs 
    #get songs from song.all
    Song.all.select{|songs| songs.artist == self } 
  end
  
  def self.find_or_create_by_name(string_name)
    artist = self.all.find{|art| art.name == string_name} 
    (artist.nil?) ? Artist.new(string_name) : artist 
  end
  
  def print_songs
    list = self.songs
    list.each{|song| puts song.name}
  end
  
end