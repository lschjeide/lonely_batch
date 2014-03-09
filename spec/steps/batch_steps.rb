step "a batch of files" do 
  	@batch = Batch.new("input_files/taxonomy.xml", "input_files/destinations.xml")
end

step "the batch ids should be :ids" do |ids|	
	expect(@batch.all_ids.join(", ").to_s).to eq(ids)
end