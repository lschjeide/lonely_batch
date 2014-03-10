    
Feature: Browse Higher Taxonomies
  Scenario: Browsing South Africa
    Given a location "South Africa"
    Then the higher taxonomies should be "World, Africa"
    
  Scenario: Browsing Cape Town
    Given a location "Cape Town"
    Then the higher taxonomies should be "World, Africa, South Africa"

  Scenario: Browsing  Port Sudan
  	Given a location "Port Sudan"
  	Then the higher taxonomies should be "World, Africa, Sudan, Eastern Sudan"
  	
  Scenario: Browsing Africa
    Given a location "Africa"
    Then the higher taxonomies should be "World"
    
  Scenario: Browsing Africa
    Given a location "Port Sudan"
    Then the higher taxonomy ids should be "00000, 355064, 355629, 355630"