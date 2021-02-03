class SessionsController < ApplicationController
  before_action :require_logout, only: [:new]
  def new; end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in'
    else
      redirect_to login_url, alert: 'Invalid name'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out'
  end

  private

  def require_logout
    return unless signed_in?

    flash[:error] = 'You are already logged in'
    redirect_to root_url
  end
end
