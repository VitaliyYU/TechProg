require 'nokogiri'
require_relative 'dance'

class DanceDOMParser
 attr_reader :dances
 
 def initialize(doc)
    @doc = doc
    @dances = Array.new
  end
  
  def parse
    @doc.search('dance').each do |dance|
      new_dance = Dance.new
      new_dance.danceType = dance.at('DanceType').text
      new_dance.sceneType = dance.at('SceneType').text
      new_dance.musicType = dance.at('MusicType').text
      new_dance.dancerType = dance.at('DancerType').text
      new_dance.id = dance['id']
      danceGroup = dance.at('DanceGroup')

      new_dance.danceGroup.danceGroupName = danceGroup.at('DanceGroupName').text
      new_dance.danceGroup.danceGroupAge = danceGroup.at('DanceGroupAge').text
    
	  dancer = dance.at('Dancer')
	  
	  new_dance.dancer.dancerName = dancer.at('DancerName')
	  new_dance.dancer.dencerGender = dancer.at('DancerGender')
	  new_dance.dencer.dencerAge = dencer.at('DencerAge')
	  new_dance.dencer.dencerAgeOfExperience = dencer.at('DencerAgeOfExperience')
	
      @dances.push(new_dance)
    end
    puts "\nParsed by DOM"
    puts dances
  end
 
end


