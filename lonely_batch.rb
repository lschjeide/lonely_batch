#!/usr/bin/env ruby


require "./lib/batch.rb"
require "./lib/location.rb"

puts "executing…"

#"input_files/taxonomy.xml", "input_files/destinations.xml"

if !ARGV[1].nil? and !ARGV[0].nil? and File.exist?(ARGV[1]) and File.exist?(ARGV[0])

	batch = Batch.new(ARGV[0], ARGV[1])
	batch.batch_create()
	puts "finished!"
	
else
	puts "Required to have file locations for taxonomy, destinations respectively."
end

