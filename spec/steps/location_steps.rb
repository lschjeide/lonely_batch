step "a location :loc" do |loc|	
	@location = Location.new(loc)
end

step "the lower taxonomies should be :locations" do |locations|
	expect(@location.get_lower.to_s).to eq(locations)
end