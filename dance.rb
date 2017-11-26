class Dancer
	attr_accessor :dancerName, :dancerGender, :dancerAge,:dancerAgeOfExperience
end
class DanceGroup
  attr_accessor :NameOfDanceGroup, :AgeOfDanceGroup
end
class UnitOfDance
	attr_accessor :id, :danceType, :sceneType, :musicType, :dencer,:danceGroup, :dancerType 
	def initialize
	 @danceGroup = DanceGroup.new
	 @dancer = Dancer.new
	 end
end
	