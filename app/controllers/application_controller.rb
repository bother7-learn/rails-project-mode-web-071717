class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  # before_action :clearflash
  # def clearflash
  #   flash[:message] = nil
  # end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


end
