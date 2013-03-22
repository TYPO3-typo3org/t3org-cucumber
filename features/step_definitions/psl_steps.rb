Then /^I should see the listing$/ do
	page.should have_xpath("//*[@class='s-membership']")
end