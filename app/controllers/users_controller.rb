class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user = User.find(params[:id], :include => :tweets)
    @new_tweet = Tweet.new if @user == current_user
  end
  
  # POST /users/1/follow
  def follow
#    redirect_to '/' if params[:id].blank?
    puts params.inspect
    @user = User.find(params[:id])
    current_user.followed << @user
    redirect_to @user
  end
  
  # DELETE /users/1/follow
  def unfollow
    puts params.inspect
    @user = User.find(params[:id])
    current_user.followed.delete(@user)
    redirect_to @user
  end
end
