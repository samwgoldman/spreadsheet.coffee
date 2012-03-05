Feature: Making calculations with the spreadsheet

  Scenario: Calculating a simple math expression
    When  I select A1
    And   I enter "2 + 2" into the expression editor
    Then  the value at A1 should be "4"
