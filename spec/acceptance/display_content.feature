    
Feature: Display Content
  Scenario: Display Introduction on South Africa
    Given a location "South Africa"
    Then the introductory content should begin with "Travel Alert: Crime is a problem throughout South Africa"
    
  Scenario: Display History on South Africa
    Given a location "South Africa"
    Then the history content should begin with "In 1910 the Union of South Africa was created"

  Scenario: Display History Overview on South Africa
    Given a location "South Africa"
    Then the history overview content should begin with "The earliest recorded inhabitants of this area of Africa were"