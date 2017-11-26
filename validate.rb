require 'rubygems'
require 'nokogiri'

xsd = Nokogiri::XML::Schema(File.read('Dance.xsd'))
doc = Nokogiri::XML(File.read('Dance.xml'))

xsd.validate(doc).each do |error|
  puts error.message
end