class VotingsController < ApplicationController
  skip_before_filter :login_required, :only => [:index, :show]
  before_filter :set_user, :only => :index
  def index
    @votings = @user.votings
  end
  
  def show
    @voting = Voting.find_by_permalink_and_user_login!(params[:id], params[:user_id])
  end
  
  def new
    @voting = Voting.new(params[:voting])
  end
  
  def create
    @voting = current_user.votings.new(params[:voting])
    if @voting.save
      redirect_to user_voting_url(current_user.login, @voting.permalink)
    else
      render :action => :new and return
    end
  end
  
  
  private
  def set_user
    if params[:user_id]
      @user = User.find_by_login!(params[:user_id])
    end
    @user ||= current_user
  end
end
