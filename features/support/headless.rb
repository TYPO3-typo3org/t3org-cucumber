require 'headless'

# http://iafonov.github.com/blog/setup-jenkins-to-run-headless-selenium.html

headless = Headless.new()
headless.start

at_exit do
	headless.destroy
end