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

# Two Pair (3,2) > High Card (A)
Scenario: Two Pairs
    Given I have "3H 3D 2S 2D AC"
    Then my ranking is "Two Pair" with value 3,2

Scenario: Three Of A Kind
    Given I have "AH AD AC 2S 3S"
    Then my ranking is "Three Of A Kind" with value A

# Three (A) > Pair (2)
Scenario: Three Of A Kind
    Given I have "AH AD AC 2S 2H"
    Then my ranking is "Three Of A Kind" with value A

Scenario: Simple straight
    Given I have "2H 3H 4S 5C 6D"
    Then my ranking is "Straight" with value 6

Scenario: Jumbled straight
    Given I have "QH AH TS JC KD"
    Then my ranking is "Straight" with value A
