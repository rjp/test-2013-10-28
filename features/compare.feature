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
