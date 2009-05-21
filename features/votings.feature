Feature: Voting
  In order to create new votings
  As a logged in user
  I want to create new votings on the web-interface
  I want to create new votings via twitter
  I want to edit my votings
  I want to see the votes
  
  Scenario: Create a new votings via web-interface
    Given I am logged in as "TomK32"
    And I go to "/votings/new"
    And I fill in "voting_question" with "Is there a god?"
    And I press "Create"
    Then I should see the template "r/votings/show"
    And I should be redirected to "/votings/TomK32/is-there-a-god"
    And I should see a page titled "Is there a god?"
