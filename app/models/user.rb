class User < TwitterAuth::GenericUser
  has_many :votings
  has_many :votes
end
