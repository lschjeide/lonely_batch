require "location"

describe Location do
	
	
  	
  	
  describe "initialization" do
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
    subject(:location) { Location.new("South Africa", noko) }

    it "sets a location" do
      expect(location.get_name).to eq("South Africa")
    end

  end
  
  describe "get_name" do 
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	subject(:location) { Location.new("South Africa", noko) }
  	
  	it "gets a location name" do 
  		expect(location.get_name).to eq("South Africa")
  	end
  end
  
  describe "get_lower" do 
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	subject(:location) { Location.new("South Africa", noko) }
  	
  	it "gets a location names lower in taxonomy" do 
  		expect(location.get_lower.to_s).to eq("Cape Town, Free State, Gauteng, KwaZulu-Natal, Mpumalanga, The Drakensberg, The Garden Route")
  	end
  end

end