
When /^I search "(.*?)"( within "(.*?)")?$/ do |term,section,facet|
  within(:xpath, "//div[contains(@class, 'quick-search')]/form") do
    fill_in("q", :with => term)
    find(:xpath, "./button").click
  end

  if section then
    find(:xpath, "//ul[contains(@class, 'search-result')]/li/a/text()[contains(., '#{facet}')]/..").click
  end
end

Then(/^I should see at least (\d+) search results$/) do |exp|
  txt = find(:xpath, "//div[contains(@class, 'b-search-result-info')]").text.gsub(/.*, found (\d+) results..*/,'\1')
  assert txt.to_i > exp.to_i
end

Then(/^I should see( at least|) (\d+) main facets$/) do |cond,exp|
  num = page.all(:xpath, "//ul[contains(@class, 'search-result')]/li").length
  if (cond == "") then
    assert_equal exp.to_i, num
  else
    assert num >= exp.to_i, "#{num} <> #{exp.to_i}"
  end
end

Then(/^I should see (\d+) sidebar facets$/) do |exp|
  assert_equal exp.to_i, page.all("#aside .facets .facet").length
end


