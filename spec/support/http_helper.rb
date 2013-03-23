require 'httparty'

class TestHttp
  include HTTParty
  base_uri ENV['domain'] ? ENV['domain'] : 'www.latest.dev.t3o.typo3.org'
  no_follow true
end