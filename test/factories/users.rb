
Factory.define :user do |user|
  user.login 'User'
  user.twitter_id {rand(1_000_000)}
end
