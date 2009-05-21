require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  should_belong_to :voting
  should_belong_to :user

end
