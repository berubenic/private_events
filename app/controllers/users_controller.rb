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
    return redirect_to login_url unless signed_in?

    @user = User.find(session[:user_id])
    @hosted_events = @user.events
    @attended_events = @user.attended_events
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
