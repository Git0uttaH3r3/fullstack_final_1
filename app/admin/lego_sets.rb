ActiveAdmin.register LegoSet do
  permit_params :set_id, :title, :image, :price, :average_rating

  index do
    selectable_column
    id_column
    column :set_id
    column :title
    column :image
    column :price
    column :average_rating
    actions
  end

  form do |f|
    f.inputs 'Lego Set Details' do
      f.input :set_id
      f.input :title
      f.input :image
      f.input :price
      f.input :average_rating
    end
    f.actions
  end
end

