require "happymapper"

XML_STRING = File.read("Dance.xml")

class UnitOfDance; end;              # fwd reference

class Dance
  include HappyMapper
  tag 'Dance'

  attribute :xmlns, String
  has_many :Dance, UnitOfDance, :tag => 'UnitOfDance'
end
class UnitOfDance
  include HappyMapper
  tag 'UnitOfDance'

  element :DanceID, String
  element :DanceType, String
  element :SceneType, String
  element :MusicType, String
  element :DanceGroup, String
  element :DancersType, String
  element :number, Integer
end

def parseXML
  Dance.parse(XML_STRING, :single => true)
end

parsed = parseXML
count = parsed.Dance.count
puts count
sorted = parsed.Dance.sort_by {|obj| obj.number}
for i in 0..(count - 1)
  puts sorted[i].number
end