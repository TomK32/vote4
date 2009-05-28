class User < TwitterAuth::GenericUser
  has_many :votings
  has_many :votes
  named_scope :recent, :order => 'created_at DESC'
  alias_attribute :screen_name, :login
  alias_attribute :profile_background_tile, :profile_background_tiled
  attr_accessor :notifications, :following
  
  def self.find_and_update_or_create(attrs)
    user = self.find_or_initialize_by_twitter_id(attrs['id'])
    user.attributes = attrs
    user.save!
    user
  end
end
