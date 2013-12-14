Feature: Upload of an extension is possible

  Background:
    Given I go to extension-key-registration
    And I login with a "valid" username
    And I register a valid extension key

  @long
  Scenario: uploading an extension is possible
    Given I click the upload button for that extension
    And I enter an upload description
    And I select a file to upload
    When I press "Upload extension"
    Then I should see a success message

  @long
  Scenario Outline: When upload fails a helpful message is shown
    Given I click the upload button for that extension
    And I enter an upload description
    And I select a file <type> to upload
    When I press "Upload extension"
    Then I should see an error message saying "<string>"
  Examples:
    | type                          | string                                                        |
    | without TYPO3 constraint      | http://typo3.org/news/article/announcing-ter-cleanup-process/ |
    #| that is not a zip             |                                                               |
    | without a set version         | no version information                                        |
    #| with folder in zip            |                                                               |
