Feature: Pages hold two or more Platinum Sponsor banners

  @long
  Scenario Outline: Homepage has 4 sponsor banners
    Given I am on <page_name>
    Then I should see <amount> active sponsor banners
    And the sponsor banners should be different
    And the links <should_follow> be followed by search engines
    And I should see them changing
  Examples:
    | page_name | amount | should_follow     |
    | home      | 4      | should            |
    | download  | 2      | should not        |
    | ter       | 2      | should not        |