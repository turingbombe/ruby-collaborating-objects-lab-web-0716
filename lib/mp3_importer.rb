require 'pry'
class MP3Importer
  attr_accessor :path, :files
  @@all = []
  def initialize(path)
    @path = path
    @files = []
  end
  
  def files
    filename_array = Dir.entries(path).each {|filenames| @files << filenames}  
    filename_array.delete_if {|array| array.start_with?(".")}
  end

  def import
    self.files.each do |filenames|
      new_song = Song.new_by_filename(filenames)
      new_song.artist.save
    end   
    # binding.pry
  end

end