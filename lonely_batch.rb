#!/usr/bin/env ruby


require "./lib/batch.rb"
require "./lib/location.rb"

puts "executing…"

batch = Batch.new("input_files/taxonomy.xml", "input_files/destinations.xml")

batch.batch_create()

puts "finished!"