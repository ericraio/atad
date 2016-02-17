class Notifications < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.welcome.subject
  #
  def welcome(user_id)
    @user = User.find(user_id)
    mail to: @user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.daily.subject
  #
  def daily(user_id, tip_id)
    @user = User.find(user_id)
    @tip = Tip.find(tip_id)
    mail to: @user.email, subject: "[VIP Agile Tip] ★  #{@tip.subject}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.weekly.subject
  #
  def weekly(user_id)
    @user = User.find(user_id)
    mail to: @user.email
  end
end
