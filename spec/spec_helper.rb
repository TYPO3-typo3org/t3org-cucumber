require 'rspec'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}

RSpec.configure do |c|
  c.mock_with :rspec
end