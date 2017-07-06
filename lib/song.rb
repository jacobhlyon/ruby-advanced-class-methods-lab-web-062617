require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
  	@name = name
  	@artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	new_song = self.new 
  	@@all << new_song
  	new_song
  end

  def self.new_by_name(name)
  	new_song = self.new
  	new_song.name = name
  	new_song
  end

  def self.create_by_name(name)
  	new_song = self.new 
  	new_song.name = name
  	@@all << new_song
  	new_song
  end

  def self.find_by_name(name)
  	@@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if find_by_name(name)
  		find_by_name(name)
  	else
  		create_by_name(name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by{ |song| song.name}
  end

  def self.new_from_filename(filename)
  	new_filename = filename.split(" - ")
  	new_song = self.new
  	new_song.artist_name = new_filename[0]
  	new_song.name = (new_filename[1].split ".mp3").join()
  	new_song
  end

  def self.create_from_filename(filename)
	new_filename = filename.split(" - ")
  	new_song = self.new
  	new_song.artist_name = new_filename[0]
  	new_song.name = (new_filename[1].split ".mp3").join()
  	@@all << new_song
  	new_song
  end

  def self.destroy_all
  	self.all.clear
  end

end
