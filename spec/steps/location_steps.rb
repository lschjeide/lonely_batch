step "a location :loc" do |loc|	
	f = File.open("input_files/taxonomy.xml") 
  	@noko = Nokogiri::XML(f)
  	f2 = File.open("input_files/destinations.xml") 
  	@noko_destin = Nokogiri::XML(f2)
  	loc_id = @noko.xpath("//*/node[node_name = '#{loc}']/@atlas_node_id").text
	@location = Location.new(loc_id, @noko, @noko_destin)
end

step "the lower taxonomies should be :locations" do |locations|
	expect(@location.get_lower.join(", ").to_s).to eq(locations)
end

step "the lower taxonomy ids should be :locations" do |locations|
	expect(@location.get_lower_ids.join(", ").to_s).to eq(locations)
end

step "the higher taxonomies should be :locations" do |locations|
	expect(@location.get_higher.join(", ").to_s).to eq(locations)
end

step "the higher taxonomy ids should be :locations" do |locations|
	expect(@location.get_higher_ids.join(", ").to_s).to eq(locations)
end

step "the introductory content should begin with :begin_text" do |text|
	expect(@location.get_intro.to_s[0..text.length-1]).to eq(text)
end

step "the history content should begin with :begin_text" do |text|
	expect(@location.get_history.to_s[0..text.length-1]).to eq(text)
end

step "the history overview content should begin with :begin_text" do |text|
	expect(@location.get_history_overview.to_s[0..text.length-1]).to eq(text)
end