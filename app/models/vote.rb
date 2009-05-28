class Vote < ActiveRecord::Base
  belongs_to :voting
  belongs_to :user
  named_scope :recent, :order => 'created_at DESC'
  default_scope :conditions => {:deleted => false}
  
  validates_presence_of :user_login, :on => :create
  before_validation_on_create :set_user_login
  
  def set_user_login
    self.user_login = self.user.login if self.user
  end
end
