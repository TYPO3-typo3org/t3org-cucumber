def google_mail_login
	visit('https://mail.google.com/')
	fill_in('Email', :with => mail_user)
	fill_in('Passwd', :with => mail_password)
	click_button('Sign in')
end


When /^(?:|I )open the login popup/ do
	tag = find(:css, '#login-status a')
	tag.trigger(:mouseover)
end

When /^(?:|I )fill in new user data$/ do
	@username = "t3ts" + Time.now.to_i.to_s
	fill_in("Name", :with => "Test user")
	fill_in("E-mail", :with => mail_address_for(@username))
	fill_in("Username", :with => @username)
	fill_in("Password", :with => @username + "!#")
	fill_in("Repeat", :with => @username + "!#")
end

Then /^(?:|I )should see the confirmation$/ do
	page.should have_xpath("//*[contains(@class,'tx-ajaxlogin-widget')]//div[contains(@class,'message-ok')]")
end

When /^(?:|I )fill in invalid (.*) data$/ do |invalid_username|
	@username = "t3ts" + Time.now.to_i.to_s
	fill_in("Name", :with => "Test user")
	fill_in("E-mail", :with => mail_address_for(@username))
	fill_in("Username", :with => invalid_username)
	fill_in("Password", :with => @username + "!#")
	fill_in("Repeat", :with => @username + "!#")
end

Then /^(?:|I )should see an error message$/ do
	begin
		@test_string = 'Username must be at least 3 characters and can contain 0-9 a-z - _ only.'
		page.should have_xpath("//*/text()[contains(., '#{@test_string}')]")
	rescue Exception => e
		puts e
	end

end

When /^(?:|I )fill in a "(.*?)" username$/ do |type|
	if type == 'valid'
		fill_in("user", :with => "typo3Plonk")
		fill_in("pass", :with => "plonk1234")
	else
		fill_in("user", :with => "nothingHere")
		fill_in("pass", :with => "totoalUnusedPassword")
	end
end

When /^(?:|I )login with a "(.*?)" username/ do |type|
	steps %Q{
		When I open the login popup
		And I fill in a "valid" username
		And I press "Login"
  }
end

Given /^(?:|that )I am logged in$/ do
	steps %Q{
		When I login with a "valid" username
		Then I should see "My account"
	}
end

Then /^(?:|I )should see "(.*?)"$/ do |text|
	page.should have_xpath("//*/text()[ . = '#{text}']")
end

Then /^(?:|I )logout$/ do
	click_on('Logout')
end

Given /^the session is cleared$/ do
	Capybara.reset_sessions!
	Capybara.use_default_driver
end

Given /^I login to gmail$/ do
	google_mail_login
end
When /^(?:|I )open the message with subject "([^"]*)"$/ do |arg|
	find("//span[@class='ts']//text()[contains(.,'#{arg.gsub(/##domain##/, current_domain)}')]/../..").click
end
When /^(?:|I )follow the confirmation link$/ do
	page.should have_xpath("//table//div[@class='msg']/a")
	value = find("//table//div[@class='msg']/a")['href']
	visit(value)
end
Then /^(?:|I )should see the confirmation for account activation$/ do
	page.should have_xpath("//*/text()[contains(., 'Your account has been successfully activated.')]")
end

Given /^(?:|I )clear my inbox$/ do
	google_mail_login
	visit('https://mail.google.com/mail/h/')
	checkboxes = all(:css, "input[type='checkbox']")
	checkboxes.each do |checkbox|
		checkbox.set(true)
	end
	unless checkboxes.empty? then
		first("//input[contains(@value, 'Delete')]").click
		page.should have_xpath("//*[contains(text(), 'moved to the Trash.')]")
	end
end

