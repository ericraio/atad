class AddNewsletterFlagsToUser < ActiveRecord::Migration
  def change
    add_column :users, :daily_emails, :boolean, default: true
    add_column :users, :weekly_emails, :boolean, default: false
  end
end
