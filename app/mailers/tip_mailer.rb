class TipMailer < ApplicationMailer
  default from: '"Agile Tips" <tips@agiletipaday.com>'

  def daily(user, tip)
    @user, @tip = user, tip
    mail({
      to: @user.email,
      subject: "[VIP Agile Tip] ★  #{@tip.subject}",
      from: "\"#{@tip.creator.first_name} from Agile Tips\" <tips@agiletipaday.com>"
    })
  end

  def weekly(user_id)
    @user = User.find(user_id)
    mail to: @user.email
  end

end
