ActiveAdmin.register Tip do

  form do |f|
    inputs do
      input :subject
      input :body, as: :html_editor
    end

    actions
  end

  action_item :send_test_email, only: :edit do
    link_to 'Send Test Email', '#'
  end

  permit_params :subject, :body
end
