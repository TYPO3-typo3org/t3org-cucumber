Feature: Regular search include various content categories as facet

  Scenario: I can see all facets for a trivial search
    Given I am on t3o
    And I search "solr"
    Then I should see at least 20 search results
    And I should see 8 main facets

  Scenario: I can see specific facets when searching for news
    Given I am on t3o
    And I search "solr" within "News"
    Then I should see at least 10 search results
    And I should see 3 sidebar facets
