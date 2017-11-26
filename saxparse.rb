require "sax-machine"
require "rspec"

class UnitOfDance
  include SAXMachine
  
  element :DanceID
  element :DanceType
  element :SceneType
  element :MusicType
  element :DanceGroup
  element :DancersType
  element :number
end

text = File.read("Dance.xml")

class Wikihandler
  include SAXMachine
  elements :UnitOfDance, :as => :Dance , :class => UnitOfDance
end

describe Wikihandler do
  before(:all) do
    @parser = Wikihandler.new
    @parser.parse text
  end

  it "should parse the proper number of dance" do
    @parser.Dance.count.should eq 3
  end

  it "should parse the dance id of each entry" do
    @parser.Dance[0].DanceID.should eq "ID_3"
  end

  it "should parse the music type of each entry" do
    @parser.Dance[1].MusicType.should eq "live music"
  end
end

parser = Wikihandler.new
parser.parse text

count = parser.Dance.count
puts count

sorted = parser.Dance.sort_by {|obj| obj.number}
for i in 0..(count - 1)
  puts sorted[i].number
end