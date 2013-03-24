Feature: Stay on the page after login

  Scenario: Login on a news detail page
    Given I read the most recent news
    When I follow the login link
    And I login with a "valid" username
    Then I should be redirected to the article