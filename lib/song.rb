class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new 
    song.save
    song 
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = Song.new 
    song.name = name 
    song 
  end

  def self.create_by_name(name)
    song = Song.new 
    song.name = name 
    song.save 
    song 
  end

  def self.find_by_name(name)
    self.all.find do |song|
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

  def self.alphabetical
    self.all.sort_by do |song|
      song.name 
    end

  end

  def self.new_from_filename(filename)
    files = filename.split(/( - )/)
    song = Song.new 
    song.artist_name = files[0]
    new_song = files[files.length - 1]
    new_song = new_song[0, new_song.length - 4]
    song.name = new_song
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save 
    song 
  end
  
  def self.destroy_all
    self.all.clear 
  end
  
end
