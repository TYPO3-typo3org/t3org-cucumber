Given(/^I read the most recent news$/) do
  steps %Q{
      Given I am on home
  }
  find(:xpath, "(//div[contains(@class, 'b-news-item')])[1]/h5/a").click
  @news_headline = find("h1").text
end

When(/^I follow the login link$/) do
  @left_news_url = current_url
  find(:xpath, "//a[text() = 'log in']").click
end

Then(/^I should be redirected to the article$/) do
  page.should have_xpath("//h1/text()[contains(., '#{@news_headline}')]")
  current_url.should == @left_news_url
end

