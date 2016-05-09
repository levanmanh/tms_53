class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper

  def verify_admin
    unless current_user.role?
      flash[:danger] = t "verify_admin"
      redirect_to root_path
    end
  end
end
