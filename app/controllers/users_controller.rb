class UsersController < ApplicationController

  def create
    User.subscribe(user_params)
    redirect_to root_url
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
