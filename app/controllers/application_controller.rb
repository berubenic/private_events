class ApplicationController < ActionController::Base
  helper_method :require_logout, :require_signed_in

  def signed_in?
    session[:user_id]
  end

  def require_logout
    return unless signed_in?

    flash[:error] = 'You are already logged in'
    redirect_to root_url
  end

  def require_signed_in
    return if signed_in?

    flash[:error] = 'You must be logged in'
    redirect_to login_url
  end
end
