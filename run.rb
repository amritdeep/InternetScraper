require_relative 'scraper'
require 'pry'

scraper = Scraper.new("http://www.highspeedinternet.com/", "files", "input.csv", "output.csv")
content = scraper.read_content
output = scraper.write_content
puts output.count