Feature: Test possible side effects of the login cache
# see http://forge.typo3.org/issues/35508

  Scenario: Navigate before login in
    Given I am on home
    And I am on another page
    And I am on yet another page
    When I open the login popup
    And I fill in a "valid" username
    And I press "Login"
    Then I should see that I am logged in

  Scenario: Restarting browser does not break login
    Given I am on home
    And the session is cleared

    Given I am on home
    When I open the login popup
    And I fill in a "valid" username
    And I press "Login"
    Then I should see that I am logged in

  Scenario: Login status is remembered on page navigation
    Given I am on home
    And I am logged in
    And I am on another page
    Then I should see that I am logged in

  Scenario: Login works after clicking around the login flyout
    Given I am on home
    And I open the login popup

    When I follow "Forgot password?"
    And I follow "To login form"

    When I login with a "valid" username
    Then I should see that I am logged in

  Scenario: Logout status is remembered on page navigation
    Given I am on home
    And I am logged in

    When I open the login popup
    And I follow "Logout"
    And I am on another page
    Then I should see that I am not logged in
    And I should not see "You are now logged out."

  Scenario: Logout is possible after page navigation
    Given I am on home
    And I am logged in

    When I am on another page
    And I open the login popup
    And I follow "Logout"
    Then I should see "You are now logged out."
    And I should see that I am not logged in

  Scenario: User displays as logged out when browser is restarted
    Given I am on home
    And I am logged in

    Given the session is cleared
    And I am on home

    Then I should see that I am not logged in