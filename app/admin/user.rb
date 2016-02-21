ActiveAdmin.register User do

  index do
    id_column
    column :email
    column :daily_emails
    column :weekly_emails
    column :invite_count
    column :created_at
    column :updated_at
    actions
  end

end
