class UsersController < ApplicationController
  def unsubscribe
    if !params[:token] || !params[:email]
      redirect_to root_url
    end

    @user = User.read_email_token(params[:token])

    if !@user
      redirect_to root_url
    end

    @user.unsubscribe_from_daily_emails
  end
end
