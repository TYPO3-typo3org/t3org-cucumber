Given(/^(?:|I )am on (.+)$/) do |page_name|
	visit path_to(page_name)
end

When /^(?:|I )(?:go to|reload) (.+)$/ do |page_name|
	visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
	click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
	click_link(link)
end

Then /^I should see them changing$/ do
  page.should have_xpath(@path.gsub!(/OLDVALUE/, @oldvalue))
end

Then(/^I should see an error message saying "([^"]*)"$/) do |msg|
  xpath = "//div[contains(@class, 'message-error')]"
  page.should have_xpath(xpath)
  unless msg.nil?
    el = find(xpath)
    assert el.text.include?(msg), "expected error message to contain '#{msg}', but it said '#{el.text}'."
  end
end

Then(/^I should see a success message/) do
  page.should have_xpath("//div[contains(@class, 'message-ok')]")
end