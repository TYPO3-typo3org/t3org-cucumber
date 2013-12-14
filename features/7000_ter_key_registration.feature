Feature: Registering an extension key on the webpage is possible

  Background:
    Given I go to extension-key-registration
    And I login with a "valid" username
    And I follow "Register extension key"

  Scenario: When I register a new extension key it shows up in my list
    Given I register a valid extension key
    Then I should see a success message
    And I should see it in my extension key list

  Scenario Outline: Registration of invalid extension keys is not possible
    Given I register <extension_key> as extension key
    Then I should see an error message saying "Extension key is invalid"
  Examples:
    | extension_key                          |
    | tt_news                                |
    | #!?                                    |
    | sh                                     |
    | this_is_a_very_long_extension_key_name |
