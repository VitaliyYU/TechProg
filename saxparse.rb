require "sax-machine"
require "rspec"

class TouristVoucher
  include SAXMachine
  element :voucherID
  element :voucherType
  element :country
  element :numberOfDays
  element :transport
  element :hotelCharacteristic
  element :cost
end

text = File.read("ТouristVouchers.xml")

class Wikihandler
  include SAXMachine
  elements :touristVoucher, :as => :touristVouchers , :class => TouristVoucher
end

describe Wikihandler do
  before(:all) do
    @parser = Wikihandler.new
    @parser.parse text
  end

  it "should parse the proper number of hotels" do
    @parser.touristVouchers.count.should eq 3
  end

  it "should parse the hotel id of each entry" do
    @parser.touristVouchers[0].id.should eq "1"
  end

  it "should parse the hotel name of each entry" do
    @parser.touristVouchers[1].country.should eq "Ukraine"
  end
end

parser = Wikihandler.new
parser.parse text

count = parser.touristVouchers.count
puts count

sorted = parser.touristVouchers.sort_by {|obj| obj.cost.to_f}
for i in 0..(count - 1)
  puts sorted[i].cost
end