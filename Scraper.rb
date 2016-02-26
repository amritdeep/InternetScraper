require 'rubygems'
require 'nokogiri'
require 'pry'
require 'JSON'
require 'csv'
require 'mechanize'

class Scraper
	def initialize(url, folder, csvfile, filename)
		@url = url
		@folder = folder
		@csvfile = csvfile
		@filename = filename
	end

	def read_content
		@zip_code = []
		@place_name = []
		@state_name = []
				# 
		file_path = "#{@folder}/#{@csvfile}" || "#{@csvfile}"
		content = CSV.read(file_path)
		content.each do |content|
			content.compact
			@zip_code << content[0]
			@place_name << content[1]
			@state_name << content[2]
			sleep 1	
		end
		@zip_code = @zip_code.compact
		@place_name =  @place_name.compact
		@state_name = @state_name.compact
	end

	def write_content	
		file_path = "#{@folder}/#{@filename}" || "#{@filename}"
		CSV.open(file_path, "wb") do |csv|
			@zip_code.each do |zip|
				mechanize = Mechanize.new
				mechanize.get(@url) do |page|
			  		search_result = page.form_with(:class => "zip-form") do |search|
			    		search.zip = zip
				  	end.submit
				  	sleep 3.5
					  	search_result.search(".provider").each do |provider|
					  		provider_result = provider.search(".features > a").text
					  		speed_result = provider.search(".speed").text
					  		rating_result = provider.search(".user-rating").children[1].attributes['data-clickedon'].value
					  		csv << [zip, provider_result, speed_result, rating_result]
					  	end
				end
			end
		end
	end



end
