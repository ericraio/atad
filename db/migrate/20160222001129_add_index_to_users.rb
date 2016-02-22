class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :daily_emails
    add_index :users, :weekly_emails
  end
end
