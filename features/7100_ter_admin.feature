Feature: Test features of the admin tab

  Scenario: Admins see an admin tab in TER section
    Given I go to extension-key-registration
    And I login as "admin"
    Then I want to see a tab labeled "Admin"