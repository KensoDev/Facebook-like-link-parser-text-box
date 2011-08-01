require 'spec_helper'
require 'url_parser'

describe UrlParser do
  before(:each) do
    @test_url = "http://www.kensodev.com/test_page.html"
    @url_parser = UrlParser.new(@test_url)
    @url_parser.parse_url
  end
  
  it "should except the url and return it" do
    @url_parser.url.should == @test_url
  end
  
  it "should have the correct title" do
    @url_parser.title.should == "This is the page title"    
  end
  
  it "should have the correct description" do
    @url_parser.description.should == "This is the page description"
  end
  
  it "should have 4 images" do
    @url_parser.images.length.should == 4
  end
  
  
end