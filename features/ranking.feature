Feature: Ranking

Scenario: High card
    Given I have "2H 3S 4D 5C 8H"
    Then my ranking is "High Card"
    And my value is 8,5,4,3,2
 
Scenario: High card
    Given I have "AH 2S 3D 4C 5H"
    Then my ranking is "High Card"
    And my value is A,5,4,3,2

Scenario: Pair
    Given I have "AH AD 2S 3D 4C"
    Then my ranking is "Pair"
    And my value is A,4,3,2

Scenario: Two Pairs
    Given I have "3H 3D 2S 2D AC"
    Then my ranking is "Two Pair"
    And my value is 3,2,A

Scenario: Three Of A Kind
    Given I have "AH AD AC 2S 3S"
    Then my ranking is "Three Of A Kind"
    And my value is A

Scenario: Simple straight
    Given I have "2H 3H 4S 5C 6D"
    Then my ranking is "Straight"
    And my value is 6

Scenario: Jumbled straight
    Given I have "QH AH TS JC KD"
    Then my ranking is "Straight"
    And my value is A

Scenario: Flush
    Given I have "2H 4H 5H 8H 9H"
    Then my ranking is "Flush"
    And my value is 9,8,5,4,2

Scenario: Full House
    Given I have "AH AD AC 2S 2H"
    Then my ranking is "Full House"
    And my value is A

Scenario: Four Of A Kind
    Given I have "AH AD AC AS 2H"
    Then my ranking is "Four Of A Kind"
    And my value is A

Scenario: Jumbled Four Of A Kind
    Given I have "AH 2D AC AS AD"
    Then my ranking is "Four Of A Kind"
    And my value is A

Scenario: Straight Flush
    Given I have "2H 3H 4H 5H 6H"
    Then my ranking is "Straight Flush"
    And my value is 6

Scenario: Reverse Straight Flush
    Given I have "6H 5H 4H 3H 2H"
    Then my ranking is "Straight Flush"
    And my value is 6

Scenario: Jumbled Straight Flush
    Given I have "2H 6H 4H 5H 3H"
    Then my ranking is "Straight Flush"
    And my value is 6
