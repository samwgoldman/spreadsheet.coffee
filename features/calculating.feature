Feature: Making calculations with the spreadsheet

  Scenario: Calculating a simple math expression
    When  I select A1
    And   I enter "2 + 2" into the expression editor
    Then  the value at A1 should be "4"

  Scenario: Calculating the sum of two cells
    When  I select A1
    And   I enter "1 + 1" into the expression editor
    And   I select A2
    And   I enter "2" into the expression editor
    And   I select A3
    And   I enter "A1 + A2" into the expression editor
    Then  the value at A3 should be "4"
