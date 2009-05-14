class ApplicationController < ActionController::Base
  helper :all
  before_filter :login_required
end
