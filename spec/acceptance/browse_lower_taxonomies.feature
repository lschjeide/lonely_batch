Feature: Browse Lower Taxonomies
  Scenario: Browsing South Africa
    Given a location "South Africa"
    Then the lower taxonomies should be "Cape Town, Free State, Gauteng, KwaZulu-Natal, Mpumalanga, The Drakensberg, The Garden Route"
    
  Scenario: Browsing Cape Town
    Given a location "Cape Town"
    Then the lower taxonomies should be "Table Mountain National Park"

    
  Scenario: Browsing Africa
    Given a location "Africa"
    Then the lower taxonomies should be "South Africa, Sudan, Swaziland"
    
