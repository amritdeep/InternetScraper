require_relative '../scraper'
require 'rspec'
require 'pry'

describe Scraper do
	let(:scraper) { Scraper.new("files", "post_code_demo.csv") }

	it "should read csv file" do
		result = scraper.read_content

		expect(result.count).to eql(15)
		expect(result.first).to eql("210")
		expect(result.last).to eql("1007")
	end
	
end