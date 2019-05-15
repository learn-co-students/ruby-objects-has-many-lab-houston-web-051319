require_relative './song.rb'

class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def add_song_by_name(song_name)
        new_song = Song.new(song_name)
        self.add_song(new_song)
    end

    def self.song_count
        song_count = 0
        @@all.each do |artist|
            song_count += artist.songs.count
        end
        song_count
    end

end