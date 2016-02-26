require_relative 'scraper'

scraper = Scraper.new("files", "post_code_demo.csv", "output.csv")
content = scraper.read_content
output = scraper.write_content
puts content