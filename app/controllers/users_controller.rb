class UsersController < ApplicationController
  before_action :require_logout, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to login_url, notice: "#{@user.name} has been created successfully" }
      else
        format.html { render :new }
      end
    end
  end

  def show
    respond_to do |format|
      if signed_in? && User.find_by_id(session[:user_id])
        @user = User.find_by_id(session[:user_id])
        @hosted_events = @user.events
        @past_events = @user.attended_events.past
        @upcoming_events = @user.attended_events.upcoming
        format.html { @user }
      else
        format.html { redirect_to login_url }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
