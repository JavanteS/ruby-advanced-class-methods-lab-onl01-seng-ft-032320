require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end
  
  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end
  
  def self.find_by_name(title)
    self.all.find {|song| song.name == title}
  end
  
  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end
  
  def Song.alphabetical
    @@all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(filename)
   # binding.pry
    song = Song.new 
    new_filename = filename.split(" - ")
    song_name = new_filename[1].gsub(".mp3", "")
    song.name = song_name
    song.artist_name = new_filename[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = Song.new
    new_filename = filename.split(" - ")
    song_name = new_filename[1].gsub(".mp3", "")
    song.name = song_name
    song.artist_name = new_filename[0]
  
  end
  
  def self.destroy_all
    @@all.clear
  end
end
