class Artist
attr_accessor :name
@@all = []
 def initialize(name)
@name = name
@songs = []
end
def add_song(song)
self.songs << song
song.artist = self
end
def songs
  @songs
end
def save
  @@all << self
end
def self.all
  @@all
  end
 def self.find_or_create_by_name(name)
   if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end

  def self.find(name)     #class method detects instances from @@all class variable
      self.all.detect { |artist| artist.name == name }
    end

    def self.create(name)   #class method creates & stores instances vs initializing
      artist = Artist.new(name)
      artist.save
      artist
    end
def print_songs
   @songs.each do |song|
     puts song.name
end
end
end
