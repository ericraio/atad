class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    mail({
      to: @user.email,
      subject: "[Agile Tip] ★  Welcome to Agile Tip a Day",
      from: "\"Agile Tip a Day\" <tips@agiletipaday.com>"
    })
  end
end
