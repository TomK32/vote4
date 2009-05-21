class Vote < ActiveRecord::Base
  belongs_to :voting
  belongs_to :user
  named_scope :recent, :order => 'created_at DESC'

end
