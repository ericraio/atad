ActiveAdmin.register Tip do

  index do
    id_column
    column :subject
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    inputs do
      input :subject
      input :body, as: :wysihtml5, commands: :all
    end

    actions
  end

  action_item :send_test_email, only: :edit do
    link_to 'Send Test Email', '#'
  end

  permit_params :subject, :body
end
