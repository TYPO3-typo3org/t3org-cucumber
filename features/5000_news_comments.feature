Feature: News can be commented

  @long
  Scenario: I can comment and after I am logged out I can see my comment
    Given I am on home
    And I am logged in
    When I go to some-news-detail-page
    And I add a new comment
    And I logout
    And I can see my comment
