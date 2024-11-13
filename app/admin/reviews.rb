ActiveAdmin.register Review do
  permit_params :lego_set_id, :name, :review, :rating

  index do
    selectable_column
    id_column
    column :lego_set_id
    column :name
    column :review
    column :rating
    actions
  end

  form do |f|
    f.inputs 'Review Details' do
      f.input :lego_set
      f.input :name
      f.input :review
      f.input :rating
    end
    f.actions
  end
end

