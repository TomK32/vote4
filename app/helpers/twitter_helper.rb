module TwitterHelper
  def twitter_profile_url(user)
    "http://twitter.com/#{user.login}"
  end

  def twitter_name(user)
    "@#{user.login}"
  end

  def profile_image(user, options = {})
    alt = "#{user.name} (@#{user.login})"
    image_tag(user.profile_image_url, :alt => alt, :title => alt)
  end
  def twitter_url(tweet)
    if tweet.respond_to?(:user_login)
      user_login = tweet.user_login
    end
    if tweet.respond_to?(:tweet_id)
      tweet_id = tweet.tweet_id
    end
    if user_login and tweet_id
      'http://twitter.com/%s/status/%s' % [user_login, tweet_id]
    end
  end
end
