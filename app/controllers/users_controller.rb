class UsersController < ApplicationController
  before_action :require_logout, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name])
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    return redirect_to login_url unless signed_in?

    @user = User.find(session[:user_id])
    @events = @user.events
  end
end
