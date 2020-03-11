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
    s = Song.new()
    s.save 
    s
  end
  def self.new_by_name(name)
    s = self.create
    s.name = name 
    return s
  end
  def self.create_by_name(name)
    s = self.new_by_name(name)
    return s
  end
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    s = self.find_by_name(name)
    if !s 
      s = self.create_by_name(name)
    end
    return s
  end
  def self.alphabetical
    return @@all.sort_by {|song| song.name}
  end
  def self.new_from_filename(filename_format)
    pair = filename_format.split(" - ")
    a = pair[0]
    s = pair[1].split(".")[0]
    s = self.find_or_create_by_name(s)
    s.artist_name = a 
    return s
  end
  def self.create_from_filename(filename_format)
    return self.new_from_filename(filename_format)
  end
  def self.destroy_all
    @@all = []
  end
end
