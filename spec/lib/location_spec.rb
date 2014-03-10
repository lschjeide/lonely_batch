require "location"

describe Location do
	
  describe "initialization" do
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	f2 = File.open("input_files/destinations.xml") 
  	noko_destin = Nokogiri::XML(f2)
    subject(:location) { Location.new("355611", noko, noko_destin) }

    it "sets a location" do
      expect(location.get_name).to eq("South Africa")
    end

  end
  
  describe "get_name" do 
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	f2 = File.open("input_files/destinations.xml") 
  	noko_destin = Nokogiri::XML(f2)
  	subject(:location) { Location.new("355611", noko, noko_destin) }
  	
  	it "gets a location name" do 
  		expect(location.get_name).to eq("South Africa")
  	end
  end
  
  describe "get_lower" do 
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	f2 = File.open("input_files/destinations.xml") 
  	noko_destin = Nokogiri::XML(f2)
  	subject(:location) { Location.new("355611", noko, noko_destin) }
  	
  	it "gets a location names lower in taxonomy" do 
  		expect(location.get_lower.join(", ").to_s).to eq("Cape Town, Free State, Gauteng, KwaZulu-Natal, Mpumalanga, The Drakensberg, The Garden Route")
  	end
  end
  
  describe "get_lower_ids" do 
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	f2 = File.open("input_files/destinations.xml") 
  	noko_destin = Nokogiri::XML(f2)
  	subject(:location) { Location.new("355611", noko, noko_destin) }
  	
  	it "gets a location ids lower in taxonomy" do 
  		expect(location.get_lower_ids.map{|x| x["id"]}.join(", ")).to eq("355612, 355614, 355616, 355619, 355622, 355624, 355626")
  	end
  end
  
  describe "get_higher" do 
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	f2 = File.open("input_files/destinations.xml") 
  	noko_destin = Nokogiri::XML(f2)
  	subject(:location) { Location.new("355611", noko, noko_destin) }
  	
  	it "gets a location names higher in taxonomy" do 
  		expect(location.get_higher.join(", ").to_s).to eq("World, Africa")
  	end
  end
  
  describe "get_higher_ids" do 
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	f2 = File.open("input_files/destinations.xml") 
  	noko_destin = Nokogiri::XML(f2)
  	subject(:location) { Location.new("355611", noko, noko_destin) }
  	
  	it "gets a location ids higher in taxonomy" do 
  		expect(location.get_higher_ids.map{|x| x["id"]}.join(", ").to_s).to eq("00000, 355064")
  	end
  end
  describe "get_intro" do 
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	text = "Travel Alert: Crime is a problem throughout South Africa"
  	f2 = File.open("input_files/destinations.xml") 
  	noko_destin = Nokogiri::XML(f2)
  	subject(:location) { Location.new("355611", noko, noko_destin) }
  	
  	it "gets the introductory content from destinations" do 
  		expect(location.get_intro.to_s[0..text.length-1]).to eq(text)
  	end
  end
  
  describe "get_history" do 
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	text = "In 1910 the Union of South Africa was created"
  	f2 = File.open("input_files/destinations.xml") 
  	noko_destin = Nokogiri::XML(f2)
  	subject(:location) { Location.new("355611", noko, noko_destin) }
  	
  	it "gets the history content from destinations" do 
  		expect(location.get_history.to_s[0..text.length-1]).to eq(text)
  	end
  end
  
  describe "get_history_overview" do 
  	f = File.open("input_files/taxonomy.xml") 
  	noko = Nokogiri::XML(f)
  	text = "The earliest recorded inhabitants of this area of Africa were"
  	f2 = File.open("input_files/destinations.xml") 
  	noko_destin = Nokogiri::XML(f2)
  	subject(:location) { Location.new("355611", noko, noko_destin) }
  	
  	it "gets the history overview content from destinations" do 
  		expect(location.get_history_overview.to_s[0..text.length-1]).to eq(text)
  	end
  end

end