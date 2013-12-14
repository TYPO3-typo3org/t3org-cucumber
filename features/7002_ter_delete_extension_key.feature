Feature: Deleting an extension key

  Background:
    Given I am in alice's browser
    And I go to extension-key-registration
    And I login as "alice"

  Scenario: Extension key can be deleted
    Given I register a valid extension key
    And I click to delete the extension key
    Then I should see a success message
    And I should not see the extension key in my list