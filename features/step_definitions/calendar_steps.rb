When(/^I fill in all required fields$/) do
  @calendar_title = 'Test Event ' + Time.now.to_i.to_s
  fill_in('tx_czsimplecal_pi2[newEvent][title]', :with => @calendar_title)
  fill_in('tx_czsimplecal_pi2[newEvent][startDay]', :with => (Date.today + 1).to_s)
end

Then(/^I should see my event$/) do
  raise '@calendar_title is not defined' if @calendar_title.nil?

  page.should have_xpath("//tr/td/h5/a[contains(.,'#{@calendar_title}')]")
end
