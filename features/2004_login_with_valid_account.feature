Feature: Login with my valid TYPO3 username on typo3.org

  @long
  Scenario: Visit typo3.org with a valid username and password
    Given I am on home
    When I open the login popup
    And I fill in a "valid" username
    And I press "Login"
    Then I should see that I am logged in

  @long
  Scenario: Mistype password but then submit valid credentials
    Given I am on home
    When I open the login popup
    And I fill in a "invalid" username
    And I press "Login"
    Then I should see "Login or password incorrect."

    When I open the login popup
    And I fill in a "valid" username
    And I press "Login"
    Then I should see that I am logged in