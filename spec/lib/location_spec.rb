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
  
  describe "get_higher" do 
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	subject(:location) { Location.new("South Africa", noko) }
  	
  	it "gets a location names lower in taxonomy" do 
  		expect(location.get_higher.to_s).to eq("World, Africa")
  	end
  end
  
  describe "get_intro" do 
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	subject(:location) { Location.new("South Africa", noko) }
  	text = "Travel Alert: Crime is a problem throughout South Africa"
  	f = File.open("input_files/destinations.xml") 
  	noko_destin = Nokogiri::XML(f)
  	it "gets the introductory content from destinations" do 
  		expect(location.get_intro(noko_destin).to_s[0..text.length-1]).to eq(text)
  	end
  end

end