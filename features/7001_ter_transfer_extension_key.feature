Feature: Transfering an extension key

  Background:
    Given I am in alice's browser
    And I go to extension-key-registration
    And I login as "alice"

    Given I am in bob's browser
    And I go to extension-key-registration
    And I login as "bob"

  @long
  Scenario: Extension key can be transfered by user
    Given I am in alice's browser
    And I register a valid extension key

    Given I am in bob's browser
    And reload extension-key-registration
    Then I should not see the extension key in my list

    Given I am in alice's browser
    When I click to transfer the extension key to "bob"
    Then I should see a success message
    But I should not see the extension key in my list

    Given I am in bob's browser
    And reload extension-key-registration
    Then I should see the extension key in my list
