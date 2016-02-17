class TipMailer < ApplicationMailer
  default from: '"Eric from Agile Tips" <tips@agiletipaday.com>'

  def daily(user, tip)
    @user, @tip = user, tip
    mail to: @user.email, subject: "[VIP Agile Tip] ★  #{@tip.subject}"
  end

  def weekly(user_id)
    @user = User.find(user_id)
    mail to: @user.email
  end
end
