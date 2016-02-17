# Preview all emails at http://localhost:3000/rails/mailers/notifications
class NotificationsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications/welcome
  def welcome
    user = User.first
    Notifications.welcome(user.id)
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifications/daily
  def daily
    user = User.first
    tip = Tip.first
    Notifications.daily(user.id, tip.id)
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifications/weekly
  def weekly
    user = User.first
    Notifications.weekly(user.id)
  end

end
