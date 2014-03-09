step "a location :loc" do |loc|	
	f = File.open("input_files/taxonomy.xml") 
  	@noko = Nokogiri::XML(f)
	@location = Location.new(loc, @noko)
end

step "the lower taxonomies should be :locations" do |locations|
	expect(@location.get_lower.to_s).to eq(locations)
end

step "the higher taxonomies should be :locations" do |locations|
	expect(@location.get_higher.to_s).to eq(locations)
end

step "the introductory content should begin with :begin_text" do |text|
	f = File.open("input_files/destinations.xml") 
  	@noko_destin = Nokogiri::XML(f)
	expect(@location.get_intro(@noko_destin).to_s[0..text.length-1]).to eq(text)
end