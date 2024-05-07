class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    before_action :require_login, unless: :login_route?

  private

  def current_user
    @usuario_logado ||= Usuario.find_by_id(session[:user_id]) if session[:user_id] 
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_login
    unless logged_in?
      redirect_to login_path,method:'get', alert: "You must be logged in to access this section"
    end
  end

  def login_route?
    request.path == login_path || request.path == new_usuario_path || request.path == usuarios_path
  end
end
