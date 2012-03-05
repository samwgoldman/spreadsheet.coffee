Feature: Editing the spreadsheet

  Scenario: Selecting a cell and updating its value
    When  I select A1
    And   I enter "Hello, World!" into the expression editor
    Then  the value at A1 should be "Hello, World!"
