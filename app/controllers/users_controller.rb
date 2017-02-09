class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	# Creates user. If user exists, it logs them in. This is fucking idiotic, but I did it for fun.
  	@user = User.new(user_params)
  	if User.exists?(username: @user.username)
  	  @user = User.find_by(username: @user.username)
  	  log_in(@user)
  	else
  	  @user.save
  	  log_in(@user)
  	end
  	redirect_to @user
  end

  def show
  	@user = User.find(params[:id])
  	@upcoming_events = @user.events.upcoming
    @past_events = @user.events.past
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
