ActiveAdmin.register Tip do

  form do |f|
    f.inputs do
      f.input :subject
      f.input :body, as: :html_editor
    end

    f.button :save
  end

  permit_params :subject, :body

end
