class StaticController < ApplicationController
  skip_before_filter :login_required
  def index
    @users = User.all(:order => "created_at DESC", :limit => 16)
  end
end
