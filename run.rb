require_relative 'scraper'

scraper = Scraper.new("files", "post_code_demo.csv")
content = scraper.read_content
puts content