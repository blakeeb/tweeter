class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user = User.find(params[:id], :include => :tweets)
    @new_tweet = Tweet.new if @user == current_user
  end
end
