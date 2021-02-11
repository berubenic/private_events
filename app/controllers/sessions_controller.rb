class SessionsController < ApplicationController
  before_action :require_logout, only: [:new]
  def new; end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      flash[:success] = 'Logged in'
      redirect_to user_url(user.id)
    else
      flash.now[:error] = 'Invalid name'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logged out'
    redirect_to login_url
  end
end
