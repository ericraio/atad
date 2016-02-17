class TipMailer < ApplicationMailer

  def daily(user_id, tip_id)
    @user = User.find(user_id)
    @tip = Tip.find(tip_id)
    mail to: @user.email, subject: "[VIP Agile Tip] ★  #{@tip.subject}"
  end

  def weekly(user_id)
    @user = User.find(user_id)
    mail to: @user.email
  end
end