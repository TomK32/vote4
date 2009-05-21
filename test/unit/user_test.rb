require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_have_many :votings
  should_have_many :votes

end
