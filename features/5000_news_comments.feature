Feature: News can be commented

  @long
  Scenario: I can comment and after I am logged out I can see my comment
    Given I am on home
    And I am logged in
    When I read the most recent news
    And I add a new comment
    And I logout
    And I can see my comment
