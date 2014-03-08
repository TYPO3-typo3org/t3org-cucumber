Feature: Create a new account for TYPO3 org

  @mail
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

  @mail
  Scenario: Check my inbox to find the confirmation mail
    Given I login to gmail
    And I open the message with subject "Registration at ##domain##"
    When I follow the confirmation link
    Then I should see the confirmation for account activation

  @long
  Scenario Outline: Visit typo3.org and and test valid names
    Given I am on home
    When I open the login popup
    And I follow "Sign up!"
    And I fill in new user data
    And I fill in <name> as the users name
    And I press "Sign up!"
    Then I should see the confirmation
  Examples:
    | name                        |
    | John Doe                    |
    | Kasper Skårhøj              |
    | Johann W. Goethe            |
    | d.k.d Internet Service GmbH |
    | Marcel Reich-Ranicki        |