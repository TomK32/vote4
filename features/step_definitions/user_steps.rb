Given /^I am logged in as "([^"]*)"$/ do |login|
  @current_user = Given "there is a User \"#{login}\""
end

Given /^there is a User "(.*)"/ do |login|
  user = User.find_by_login(login)
  if user.nil?
    user = User.create!(:login => login) do |user|
      user.twitter_id = '1234567'
    end
  end
  return user
end
