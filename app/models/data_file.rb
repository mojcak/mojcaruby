class DataFile < ActiveRecord::Base
	def self.save(upload)
    name =  upload['datafile']
    directory = "assets/images"
    # create the file path
    path = File.join(directory, name)
    # write the file
    #File.open(path, "w") do  |f|
  end
end
