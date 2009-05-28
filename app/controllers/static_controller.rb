class StaticController < ApplicationController
  skip_before_filter :login_required
  def index
#    @users = User.recent(:limit => 5)
    @votings = Voting.public.recent(:limit => 3)
    @votes = Vote.recent(:limit => 3)
  end
end
