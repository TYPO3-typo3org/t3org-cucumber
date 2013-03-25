module MailHelpers
	def mail_user
		ENV['mail_user'] || 't3o.latest'
	end
	def mail_password
		ENV['mail_password'] || ''
	end

	def mail_address_for(username)
		"#{mail_user}+#{username}@gmail.com"
	end
end

World(MailHelpers)