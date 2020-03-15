class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize
  #   @name = name
  #   @artist_name = artist_name

  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

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

    song = self.new_by_name(name)
    self.all << song

    song

  end

  def self.find_by_name(name)

    self.all.find do |song|
      song.name == name
    end

  end

  def self.find_or_create_by_name(name)

    if self.find_by_name(name)
      return self.find_by_name(name)
    end

    self.create_by_name(name)

  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    filename = filename.delete_suffix(".mp3")
    filename = filename.split(" - ")
    name = filename[1]
    artist = filename[0]

    song = self.find_or_create_by_name(name)
    song.artist_name = artist

    song

  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end

end
