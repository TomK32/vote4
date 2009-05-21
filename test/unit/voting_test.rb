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

  test "03 can vote" do
    # first let's vote
    user1 = Factory.create(:user, :login => 'User1')
    user2 = Factory.create(:user, :login => 'User2')
    voting = Factory.create(:voting, :question => 'Is there a god?')
    assert_equal true, voting.can_vote?(user1)
    assert_equal true, voting.can_vote?(user2)
    Factory.create(:vote, :voting => voting, :user => user1, :option => 'Yes')
    assert_equal false, voting.can_vote?(user1)
    assert_equal true,  voting.can_vote?(user2)
    Factory.create(:vote, :voting => voting, :user => user2, :option => 'No')
    # and now try to vote again
    assert_equal false, voting.can_vote?(user1)
    assert_equal false, voting.can_vote?(user2)

    voting.reload
    assert_equal 2, voting.votes.count
    assert_equal 1, user1.votes.count
    assert_equal 1, user2.votes.count
    
    assert_equal false, voting.can_vote?(user1)
  end
  test "04 can vote on closed voting" do
    closed_voting = Factory.create(:voting, :closed => true)
    user = Factory.create(:user)
    assert_equal false, closed_voting.can_vote?(user)
  end
  test "05 can vote for a blocked user"
end
