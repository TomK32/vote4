class User < TwitterAuth::GenericUser
  has_many :votings
  has_many :votes
  named_scope :recent, :order => 'created_at DESC'
end
