Feature: Create a new account for TYPO3 org

  Scenario:
    Given I clear my inbox

  @long
  Scenario: Visit typo3.org and create a new account
    Given I am on home
    When I open the login popup
    And I follow "Sign up!"
    And I fill in new user data
    And I press "Sign up!"
    Then I should see the confirmation

  Scenario: Check my inbox to find the confirmation mail
    Given I login to gmail
    And I open the message with subject "Registration at ##domain##"
    When I follow the confirmation link
    Then I should see the confirmation for account activation
