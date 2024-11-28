ActiveAdmin.register StaticPage do
  permit_params :title, :content, :slug

  form do |f|
    f.inputs "Static Page Details" do
      f.input :title
      f.input :slug
      f.input :content, as: :text
    end
    f.actions
  end
end
