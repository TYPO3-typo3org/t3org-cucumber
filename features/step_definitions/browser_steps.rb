Given(/^I am in (.*?)'s browser$/) do |name|
  Capybara.session_name = name
end