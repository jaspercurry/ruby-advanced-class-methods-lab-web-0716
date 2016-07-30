require 'pry'

class Song
  
  @@all = []

  def name=(name)
    @name = name
  end

  def name 
    @name
  end

  def artist_name=(artist_name)
    @artist_name = artist_name
  end

  def artist_name
    @artist_name
  end

  def self.create
    new = self.new
    @@all << new
    new
  end

  def self.new_by_name(name)
    new = self.new
    new.name=(name)
    new
  end

  def self.create_by_name(name)
    new = self.new
    new.name=(name)
    @@all << new
    new
  end

  def self.find_by_name(name)
    @@all.detect do |item|
      item.name == name
    end
  end

  def self.find_or_create_by_name(name)
    new = self.new
    new.name=(name)
    @@all << new
    new
  end

  def self.alphabetical
    @@all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(filename)
    filename.slice!".mp3"
    new = self.new
    new.name=(filename.split(" - ")[1])
    new.artist_name=(filename.split(" - ")[0])
    @@all << new
    new
  end

  def self.create_from_filename(filename)
    filename.slice!".mp3"
    new = self.new
    new.name=(filename.split(" - ")[1])
    new.artist_name=(filename.split(" - ")[0])
    @@all << new
    new
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end



end
