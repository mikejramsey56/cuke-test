Feature: Veggies
  Goal is to demonstrate a way to test web server APIs directly (no UI)
  See https://tommy-ryan.com/testing-your-apis-with-cucumber//#read-more
   to set up the required local API. To start veggie:
   cd ~/cuke-test
   slc run

  Scenario: Add a veggie
    When I create a veggie:
      | name    | tomato     |
      | color   | red        |
      | yummy   | true       |
    And I send that create request to "http://0.0.0.0:3000/api/veggies"
    Then the response status should be "200" 
    And I save the retrival id for later

  Scenario: Get the last created veggie
    Given I know the last veggie I created
    And I send that retrieve request to "http://0.0.0.0:3000/api/veggies"
    Then the retrieve response status should be "200"
    And the retrieved properties are:
      | name    | tomato     |
      | color   | red        |
      | yummy   | true       |
