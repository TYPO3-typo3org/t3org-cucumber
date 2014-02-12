Given(/^I am in (.*?)'s browser$/) do |name|
  Capybara.session_name = name
end

When(/^I clear the browser storage$/) do
  page.execute_script('window.localStorage.clear();')
  page.execute_script('window.sessionStorage.clear();')
end