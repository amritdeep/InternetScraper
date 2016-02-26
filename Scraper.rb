require 'pry'
require 'csv'

class Scraper

	def initialize(folder, csvfile)
		@folder = folder
		@csvfile = csvfile
	end

	def read_content
		@zip_code = []
		@place_name = []
		@state_name = []
		file_path = "#{@folder}/#{@csvfile}" || "#{@csvfile}"
		content = CSV.read(file_path)
		content.each do |content|
			content.compact
			@zip_code << content[0]
			@place_name << content[1]
			@state_name << content[2]
		end
		@zip_code.compact
		# @place_name.compact
		# @state_name.compact
	end
	
end
