def get_ter_extensions
	all("//*[@class='tx-solr']/div[contains(@class, 'ter-ext-list-row')]")
end

Given /^I see (\d+) extensions$/ do |amount|
	@extensions = get_ter_extensions
	assert @extensions.length == amount.to_i
end

When /^I open the next page$/ do
	find("//*[@class='tx-pagebrowse-pi1']/ul[contains(@class, 'b-pager')]/li[contains(@class, 'act')]/following::*[1]").click
end

When /^I search extensions for (.*)$/ do |term|
	within("//form[contains(@id, 'tx-solr-search-form-pi-results')]") do
		fill_in("q", :with => term)
		find_button('Search').click
	end

end

When /^I switch sorting to Downloads$/ do
	within("//div[contains(@class, 'ter-ext-list-search')]") do
		select('Downloads', :from => 'ter-ext-list-search-sorting')
	end
end

Then /^I should see (\d+) (different )?extensions$/ do |amount, different|
	assert get_ter_extensions.length >= amount.to_i
end

Then /^(.*) appears as first extension$/ do |extension_key|
	element = find("//*[@class='tx-solr']/div[contains(@class, 'ter-ext-list-row')][1]/*//span[contains(@class, 'ter-ext-list-row-key')]")
	assert element.text == extension_key, "Found #{element.text} - expected #{extension_key}"
end

Then /^(.*) appears as extension$/ do |extension_key|
	expression = "//*[@class='tx-solr']/div[contains(@class, 'ter-ext-list-row')]/*//span[contains(@class, 'ter-ext-list-row-key')][contains(text(), '#{extension_key}')]"
	page.should have_xpath(expression)
end

When(/^I register a valid extension key$/) do
  click_link("Register extension key")
  @extension_key = 'test_cucumber_' + Time.now.to_i.to_s
  fill_in('tx_terfe2_pi1[extensionKey]', :with => @extension_key)
  click_button('Save')
end

When(/^I register (.*?) as extension key$/) do |ext_key|
  @extension_key = ext_key
  fill_in('tx_terfe2_pi1[extensionKey]', :with => @extension_key)
  click_button('Save')
end

Then(/^I should see the extension key in my list$/) do
  raise "calling from wrong context" if @extension_key.nil?
  page.should have_xpath("//table[contains(@class, 'manage-keys')]/tbody/tr[contains(., '#{@extension_key}')]")
end

Then(/^I should not see the extension key in my list$/) do
  raise "calling from wrong context" if @extension_key.nil?
  page.should_not have_xpath("//table[contains(@class, 'manage-keys')]/tbody/tr[contains(., '#{@extension_key}')]")
end

When(/^I click to transfer the extension key to "([^"]*)"$/) do |name|
  raise "calling from wrong context" if @extension_key.nil?
  within("//table[contains(@class, 'manage-keys')]/tbody/tr[contains(., '#{@extension_key}')]") do
    fill_in("tx_terfe2_pi1[newUser]", :with => UserHelpers.get_username(name))
    click_button "Transfer"
  end
end

When(/^I click to delete the extension key$/) do
  raise "calling from wrong context" if @extension_key.nil?
  within("//table[contains(@class, 'manage-keys')]/tbody/tr[contains(., '#{@extension_key}')]") do
    click_link "Delete"
  end
end

Given(/^I click the upload button for that extension$/) do
  raise "calling from wrong context" if @extension_key.nil?
  within("//table[contains(@class, 'manage-keys')]/tbody/tr[contains(., '#{@extension_key}')]") do
    click_link "Upload"
  end
end

When(/^I enter an upload description$/) do
  fill_in("tx_terfe2_pi1[form][comment]", :with => "Test upload of #{@extension_key} on #{Time.now.to_s}.")
end

When(/^I select a file (.*? ?)to upload$/) do |type|
  source_file_name = TerFileHelper.get_file(type)
  source_path = File.expand_path(File.dirname(__FILE__) + '/../../files/') + '/' + source_file_name
  target_file_name = @extension_key + '_0.0.1.zip'
  target_path = File.expand_path(File.dirname(__FILE__) + '/../../tmp/') + '/' + target_file_name
  FileUtils.copy(source_path, target_path)

  attach_file('tx_terfe2_pi1[form][file]', target_path)
end