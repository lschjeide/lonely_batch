Feature: Browse Lower Taxonomies
  Scenario: Browsing Africa
    Given a location "South Africa"
    Then the lower taxonomies should be "Cape Town, Free State, Gauteng, KwaZulu-Natal, Mpumalanga, The Drakensberg, The Garden Route"