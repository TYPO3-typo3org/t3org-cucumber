Feature: Calendar events can be submitted

  Background:
    Given I am on event-submission
    And I am logged in

  Scenario: A logged in user is able to submit a new community event
    Given I follow the first "Add Event"
    And I fill in all required fields
    And press "Submit"
    Then I should see a success message

    Given I am on community-events
    Then I should see my event