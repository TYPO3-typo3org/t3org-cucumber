# See http://www.emmanueloga.com/2011/07/26/taming-a-capybara.html

require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/session'
require 'capybara-screenshot'
require 'capybara-webkit'

Capybara.default_selector = :css
Capybara.javascript_driver = :webkit
Capybara.default_driver = :webkit
Capybara.save_and_open_page_path = 'tmp/capybara'
Capybara.run_server = true
Capybara.default_wait_time = 2
