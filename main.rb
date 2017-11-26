require_relative 'domparser'
require 'nokogiri'


include Nokogiri


xsd = Nokogiri::XML::Schema(File.read('xmldance.xsd'))
doc = Nokogiri::XML(File.read('Dance.xml'))
errors = xsd.validate(doc)
if errors.length > 0
  puts 'XML not valid:'
  puts errors
  exit
else
  puts 'XML valid'
end
parser = DanceDOMParser.new(Nokogiri::XML(open("Dance.xml")))
parser.parse
