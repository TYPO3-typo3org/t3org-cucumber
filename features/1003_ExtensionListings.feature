Feature: The TER is searchable, sortable and provides extension details

  @not-latest @not-deploy
  Scenario: Open TER and check extension list
    Given I am on ter
    And I see 20 extensions
    When I open the next page
    Then I should see 20 different extensions

  @not-latest @not-deploy
  Scenario: Open TER and sort extensions
    Given I am on ter
    When I switch sorting to Downloads
    Then I should see 20 extensions
    And tt_news appears as first extension

  @not-latest @not-deploy
  Scenario Outline: Open TER supports searches and has accurate results
    Given I am on ter
    When I search extensions for <term>
    Then I should see <amount> different extensions
    And <extension_key> appears as first extension
  Examples:
    | term        | amount | extension_key |
    | templavoila | 20     | templavoila   |
    | news        | 20     | news          |
    | fed         | 9      | fed           |