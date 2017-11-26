require "happymapper"

XML_STRING = File.read("Dance.xml")

class Dance; end;              # fwd reference

class Dances
  include HappyMapper
  tag 'dances'

  attribute :xmlns, String
  has_many :dances, Dance, :tag => 'UnitOfDance'
end

class TypeOfDance
 inlcude HappyMapper
 tag 'TypeOfDance' 
end

class TypeOfScene
 include HappyMapper
 tag 'TypeOfScene'
end

class TypeOfMusic
 include HappyMapper
 tag 'TypeOfMusic'
end

class NumberOfDancer
 include HappyMapper
 tag 'NumberOfDancers'
end





class SoloType
 include HappyMapper
 tag 'SoloType'
 element :Dancer, Dancer
end

class PairType
 include HappyMapper
 tag 'PairType'
 element :Dancer, Dancer
end

class MassType
 include HappyMapper
 tag 'MassType'
 element :Dancer, Dancer
end
class Age
 include HappyMapper
 tag 'Age'
end
class AgeOfDanceGroup
 include HappyMapper
 tag 'AgeOfDanceGroup' 
end
class GenderOfDance
 include HappyMapper
 tag 'GenderOfDance'
end
class DanceGroup
 include HappyMapper
 tag 'DanceGroup'
 element :DanceGroupName, NameOfDanceGroup
 element :DanceGroupAge, AgeOfDanceGroup
end
class Dancer
 include HappyMapper
 tag 'Dancer'
 element :DancerName, NameOfDanceGroup
 element :DancerGender, GenderOfDance
 element :DancerAge, Age
 element :DancerAgeOfExperience , Age
end

class UnitOfDance
  include HappyMapper
  tag 'UnitOfDance'
  attribute :DanceID, String
  element :DanceType, TypeOfDance
  element :SceneType, TypeOfScene
  element :MusicType, TypeOfMusic
  element :DanceGroup, DanceGroup
  element :DancersType, NumberOfDancers
end

def parseXML
  Dances.parse(XML_STRING, :single => true)
end

parsed = parseXML
count = parsed.dances.count
puts count
sorted = parsed.dances.sort_by {|obj| obj.Age}
for i in 0..(count - 1)
  puts sorted[i].Age
end