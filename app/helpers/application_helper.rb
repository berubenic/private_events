module ApplicationHelper
  def signed_in?
    session[:user_id]
  end

  def signed_in_user_path
    user = User.find(session[:user_id])
    link_to(user.name, user_path(user.id))
  end
end
