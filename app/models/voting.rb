class Voting < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  named_scope :recent, :order => 'created_at DESC'
  
  has_permalink :question, :update => true

  validates_presence_of :user_login, :on => :create
  before_validation_on_create :set_user_login
  
  def set_user_login
    self.user_login = self.user.login
  end
end
