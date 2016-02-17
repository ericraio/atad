# Preview all emails at http://localhost:3000/rails/mailers/tip_mailer
class TipMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tip_mailer/daily
  def daily
    user = User.first
    tip = Tip.first
    TipMailer.daily(user.id, tip.id)
  end

  # Preview this email at http://localhost:3000/rails/mailers/tip_mailer/weekly
  def weekly
    user = User.first
    TipMailer.weekly(user.id)
  end

end
