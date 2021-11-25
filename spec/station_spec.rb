require "station"
RSpec.describe Station do

  describe "#initialize" do
    it "initialize with name" do
      subject = Station.new("name", Integer)
      expect(subject.name).to eq('name')
    end

    it "initialize with zone" do
      subject = Station.new("name", Integer)
      expect(subject.zone).to eq(Integer)  
    end
  end
end