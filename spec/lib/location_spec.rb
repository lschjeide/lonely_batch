require "location"

describe Location do
  describe "initialization" do
    subject(:location) { Location.new("South Africa") }

    it "sets a location" do
      expect(location.get_name).to eq("South Africa")
    end

  end
  
  describe "get_name" do 
  	subject(:location) { Location.new("South Africa") }
  	
  	it "gets a location name" do 
  		expect(location.get_name).to eq("South Africa")
  	end
  end

end