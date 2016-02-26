require_relative '../scraper'
require 'rspec'
require 'pry'

describe Scraper do
	let(:scraper) { Scraper.new }

	it "should return hello word" do
		result = scraper.hello
		expect(result).to eql("hello")
	end
	
end