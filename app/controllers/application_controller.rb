class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_current_user
  
  def get_current_user
    @current_user = current_user
  end
  
end
