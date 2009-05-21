require 'test_helper'

class VotingTest < ActiveSupport::TestCase
  should_belong_to :user
  should_have_many :votes

  test "01 factory" do
    assert Factory.create(:voting)
  end
  test "02 has permalink" do
    assert_equal "is-there-a-god", Factory.create(:voting, :question => 'Is there a god?').permalink
    assert_equal "um-laute", Factory.create(:voting, :question => '  Üm läute  ?').permalink
    assert_equal "um-laute-2", Factory.create(:voting, :question => '  Üm läute  ?').permalink
  end
  
end
