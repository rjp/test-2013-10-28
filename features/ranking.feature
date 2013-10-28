Feature: Ranking

Scenario: High card
    Given I have "2H 3S 4D 5C 6H"
    Then my ranking is "High Card" with value 6
 
Scenario: High card
    Given I have "AH 2S 3D 4C 5H"
    Then my ranking is "High Card" with value A

Scenario: Pair
    Given I have "AH AD 2S 3D 4C"
    Then my ranking is "Pair" with value A

Scenario: Two Pairs
    Given I have "AH AD 2S 2D 4C"
    Then my ranking is "Two Pair" with value A,2

