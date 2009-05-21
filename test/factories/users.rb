
Factory.define :user do |user|
  id = rand(1000000)
  user.login 'User%i' % id
  user.twitter_id id 
end
