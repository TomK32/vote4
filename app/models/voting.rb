class Voting < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  named_scope :recent, :order => 'created_at DESC'
  named_scope :public, :conditions => {:public => true, :closed => false}
  
  has_permalink :question, :update => true

  validates_presence_of :user_login, :on => :create
  before_validation_on_create :set_user_login
  serialize :options
  
  def set_user_login
    self.user_login = self.user.login if self.user
  end
  
  def can_vote?(user)
    return false if closed?
    ! votes.exists?(:user_id => user.id)
  end
end
