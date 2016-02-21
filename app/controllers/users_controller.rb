class UsersController < ApplicationController

  before_action :load_user_if_set, only: [:welcome, :welcome_back]

  def create
    @user = User.subscribe(user_params)
    session[:user] = @user
    if @user.new_record?
      redirect_to welcome_url
    else
      redirect_to welcome_back_url
    end
  end

  def welcome
  end

  def welcome_back
  end

  def unsubscribe
    redirect_to root_url if !params[:token] || !params[:email]
    @user = User.read_email_token(params[:token])
    redirect_to root_url if !@user
    @user.unsubscribe_from_daily_emails
  end

  def user_params
    params.require(:user).permit(:inviter_id, :email)
  end
end
