Feature: Create a new account for TYPO3 org

  @long
  Scenario: Visit typo3.org and create a new account
    Given I am on home
    When I open the login popup
    And I follow "Sign up!"
    And I fill in new user data
    And I press "Sign up!"
    Then I should see the confirmation