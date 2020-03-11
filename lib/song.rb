class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song 
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end 

  def self.create_by_name(name)
    song = self.create
    song.name = name 
    song 
  end 

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name 
    end 
  end 

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end 

  end 

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end 

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end 

  def self.destroy_all
    self.all.clear
  end 

end
