Feature: Logout from typo3.org

  Background:
    Given I am on home
    And I am logged in

  @long
  Scenario: Simple logout
    When I open the login popup
    And I follow "Logout"
    Then I should see "You are now logged out."
    And I should see that I am not logged in
