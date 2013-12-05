When /^I (open|close) the social area$/ do |state|
	not_state = state == 'open' ? 'close' : 'open'
	unless page.should have_xpath("//*[@class='b-social b-social-#{state}']")
		page.should have_xpath("//*[@class='b-social b-social-#{not_state}']")
		find("//*[@class='b-social-toggle']]").click
	end
	page.should have_xpath("//*[@class='b-social b-social-#{state}']")
end

When /^I click on the fourth stage item$/ do
	find("//*[@id='top-slider']//ul[@class='slider-nav']/li[4]/div").click
	page.should have_xpath("//*[@id='top-slider']//ul[@class='slider-nav']/li[4][@class='active']")
end

Then /^I should see user profiles$/ do
	assert page.all("//*[@id='randomUserProfiles']/*/li/img").length >= 15
end

Then /^forge activity messages$/ do
  assert page.all("//*[@id='forge-ticker']/*//li[@class='slide']").length >= 5
end

Then /^I should see the first item going active$/ do
  page.should have_xpath("//*[@id='top-slider']//ul[@class='slider-nav']/li[1][@class='active']")
end

Then /^I should see (\d+) active sponsor banners$/ do |amount|
	selector = "//*[@id='randombanners']/div/div[not(contains(@style, 'display: none;'))]/a"
	@banners = all(selector)
	# cucumber sometimes evaluates the selector even when only half the randombanners are visible.
	sleep(0.1)
	@banners = all(selector)

	assert @banners.length == amount.to_i
	@path = "//*[@id='randombanners']/div[1]/div[not(contains(@style, 'display: none;'))]/a[@href != 'OLDVALUE']"
	@oldvalue = @banners.first[:href]
end

When /^the sponsor banners should be different$/ do
	banner_urls = []
	@banners.each do |banner|
		assert !banner_urls.include?(banner[:href])
		banner_urls.push(banner[:href])
	end
end

Then /^the links should (not )?be followed by search engines$/ do |should_follow|
	should_follow = should_follow == ''
	@banners.each do |banner|
		assert banner[:rel] == should_follow ? nil : "nofollow"
	end
end