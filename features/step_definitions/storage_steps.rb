When(/^I write something in localStorage$/) do
  page.execute_script('return window.localStorage.set("foo", "bar");')
end

When(/^localStorage should be empty$/) do
  assert page.execute_script('return window.localStorage.get("foo");') == nil
end