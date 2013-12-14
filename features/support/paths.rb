module NavigationHelpers

  def current_domain
    ENV['domain'] ? ENV['domain'] : 'www.latest.dev.t3o.typo3.org'
  end

  def path_to(page_name)
    domain = current_domain
    case page_name
      when /home/
        "http://#{domain}/"
      when /t3o/
        "http://typo3.org/"
      when /download/
        "http://#{domain}/download/"
      when /ter/
        "http://#{domain}/extensions/repository/"
      when /my-account/
        "http://#{domain}/my-account/"
      when /sign-up/
        "http://#{domain}/my-account/sign-up/"
      when /edit-personal-data/
        "http://#{domain}/my-account/edit-personal-data/"
      when /professional-service-listing/
        "http://#{domain}/support/professional-services/"
      when /extension-key-registration/
        "http://#{domain}/extensions/extension-keys/"
      else
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                  "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
