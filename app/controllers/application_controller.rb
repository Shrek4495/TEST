class ApplicationController < ActionController::Base
  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    cookies[:request_path] = request.path unless logged_in?
    redirect_to login_path, alert: 'Для входа на портал пожалуйста авторизуйтесь' unless current_user
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id] if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
