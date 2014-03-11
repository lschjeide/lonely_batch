#!/usr/bin/env ruby


require "./lib/batch.rb"
require "./lib/location.rb"



#"input_files/taxonomy.xml", "input_files/destinations.xml"

if !ARGV[1].nil? and !ARGV[0].nil? and File.exist?(ARGV[1]) and File.exist?(ARGV[0])
	puts "executing…"
	batch = Batch.new(ARGV[0], ARGV[1])
	batch.batch_create()
	puts "finished! Run open output_files/00000.html to view newly created batch."
	
else
	puts "Required to have file locations for taxonomy, destinations respectively."
end

