Feature: Comparison

Scenario: High card draw
    Given I have "2H 3S 4D 5C 8H"
    And Bob has "2S 3D 4C 5H 8S"
    Then the winner is no-one

Scenario: High card Bob
    Given I have "2H 3S 4D 5C 8H"
    And Bob has "2S 3D 4C 5H 9H"
    Then the winner is Bob

Scenario: High card me
    Given I have "2H 3S 4D 5C AH"
    And Bob has "2S 3D 4C 5H 9H"
    Then the winner is me

Scenario: My flush beats Bob's pair
    Given I have "2H 4H 6H 7H 8H"
    And Bob has "2S 2D 4C 5H 9H"
    Then the winner is me

Scenario: Bob's flush beats my pair
    Given Bob has "2H 4H 6H 7H 8H"
    And I have "2S 2D 4C 5H 9H"
    Then the winner is Bob
