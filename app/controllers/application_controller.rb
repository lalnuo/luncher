class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user = User.find_by_id(session[:user_id])
  end

  def redirect_to_root_if_not_logged
    redirect_to :root unless current_user
  end
end
