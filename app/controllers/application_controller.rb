class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_user_if_set

  protected

  def load_user_if_set
    if session[:user] && @user.nil?
      @user = User.find(session[:user]['id'])
    else
      redirect_to(root_url) && return
    end
  end

  def user_for_paper_trail
    admin_user_signed_in? ? current_admin_user.try(:id) : 'Unknown user'
  end
end
