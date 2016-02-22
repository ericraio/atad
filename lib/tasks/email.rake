namespace :email do

  desc "email new daily tip"
  task daily_tip: :environment do
    User.email_new_daily_tip_to_subscribers
  end

end
