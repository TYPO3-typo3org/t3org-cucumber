# RSpec
require 'rspec/expectations'
require 'test/unit/assertions'

World(Test::Unit::Assertions)

at_exit do
#system "open ./reports/report.html"
end


Before ('@long') do
  Capybara.default_wait_time = 30
end

After('@long') do
  Capybara.default_wait_time = 2
end

# Before ('@skipped') do |scenario|
#   scenario.instance_variable_get("@skipped").each do |step|
#     step.skip_invoke!
#   end
# end

# print Console output and JavaScript error messages
After do |scenario|
  messages = page.driver.console_messages
  unless messages.empty?
    warn "Console log:"
    messages.each do |msg|
      warn "  - #{msg[:message].strip}"
    end
  end

  messages = page.driver.error_messages
  unless messages.empty?
    warn "JavaScript errors occured:"
    messages.each do |msg|
      warn "  - #{msg[:message].strip} on #{msg[:source]}:#{msg[:line_number]}"
    end
  end
end