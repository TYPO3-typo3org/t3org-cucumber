module UserHelpers

  def self.get_username(user_name)
    'autotest-' + user_name
  end

  def self.get_password(user_name)
      user_name + '-password'
  end
end

World(UserHelpers)
