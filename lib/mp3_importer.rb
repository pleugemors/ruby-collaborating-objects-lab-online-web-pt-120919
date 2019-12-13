class MP3Importer
  
  def initialize(path_way)
    
    @path = path_way 
    
  end
  
  def path
    @path
  end
  
  def files
    path_name = @path +"/*"  
    load_files= Dir.glob(path_name)
    load_files.collect{|file| file.slice!(path_name.size-1 .. -1)}
  end
  
  def import 
    fil_song = self.files 
    fil_song.each{|name| Song.new_by_filename(name)}
  end
  
end