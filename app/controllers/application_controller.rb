class ApplicationController < ActionController::Base
  helper_method :require_logout

  def signed_in?
    session[:user_id]
  end

  def require_logout
    return unless signed_in?

    flash[:error] = 'You are already logged in'
    redirect_to root_url
  end
end
