Feature: Create no new account for TYPO3 org cause of invalid user data

  @long
  Scenario Outline: Visit typo3.org and test invalid usernames
    Given I am on home
    When I open the login popup
    And I follow "Sign up!"
    And I fill in invalid <invalid_username> data
    And I press "Sign up!"
    Then I should see an error message
  Examples:
    | invalid_username |
    | as               |
    | !                |
    | 23               |
    | %$!              |
    | _username        |

  @long
  Scenario Outline: Visit typo3.org and and test invalid names
    Given I am on home
    When I open the login popup
    And I follow "Sign up!"
    And I fill in new user data
    And I fill in <invalid_name> as the users name
    And I press "Sign up!"
    Then I should see a name error message
  Examples:
    | invalid_name |
    | JustOneName  |