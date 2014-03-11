lonely_batch
============

Lonely Planet Coding Exercise

We have two (admittedly not very clean) .xml files from our legacy CMS system - taxonomy.xml holds the information about how destinations are related to each other and destinations.xml holds the actual text content for each destination.

We would like you to create a batch processor that takes these input files and produces an .html file (based on the output template given with this test) for each destination. Each generated web page must have:
1. Some destination text content. Use your own discretion to decide how much information to display on the destination page.
2. Navigation that allows the user to browse to destinations that are higher in the taxonomy. For example, Beijing should have a link to China.
3. Navigation that allows the user to browse to destinations that are lower in the taxonomy. For example, China should have a link to Beijing.

The batch processor should take the location of the two input files and the output directory as parameters.

These sample input files contain only a small subset of destinations.  We will test your software on the full Lonely Planet dataset, which currently consists of almost 30,000 destinations.

When we receive your project the code will be:
1. Built and run against the dataset supplied.
2. Evaluated based on coding style and design choices in all of these areas: 
a. Readability.
b. Simplicity.
c. Extensibility.
d. Reliability.
e. Performance.


Solution
=============

GEM
  remote: https://rubygems.org/
  specs:
    diff-lcs (1.2.5)
    gherkin (2.12.2)
      multi_json (~> 1.3)
    mini_portile (0.5.2)
    multi_json (1.9.0)
    nokogiri (1.6.1)
      mini_portile (~> 0.5.0)
    rspec (2.14.1)
      rspec-core (~> 2.14.0)
      rspec-expectations (~> 2.14.0)
      rspec-mocks (~> 2.14.0)
    rspec-core (2.14.8)
    rspec-expectations (2.14.5)
      diff-lcs (>= 1.1.3, < 2.0)
    rspec-mocks (2.14.6)
    turnip (1.2.1)
      gherkin (>= 2.5)
      rspec (>= 2.0, < 4.0)

PLATFORMS
  ruby

DEPENDENCIES
  nokogiri
  turnip


TO RUN:

bundle install

ruby lonely_batch.rb taxonomy_xml_file.xml destinations_xml_file.xml

(provided with e.g.) ruby lonely_batch.rb input_files/taxonomy.xml input_files/destinations.xml

The batch files are saved to the output_files directory in the format atlas_id.html where atlas_id is the id of the destination in both the taxonomy and destinations files.

after running, type: open output_files/00000.html to view the root ("World") page of processed batch.