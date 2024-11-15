ActiveAdmin.register Review do
  permit_params :lego_set_id, :name, :review, :rating

  form do |f|
    f.inputs "Review Details" do
      f.input :lego_set_id, as: :select, collection: LegoSet.all.collect { |lego_set| [lego_set.title, lego_set.id] }
      f.input :name
      f.input :review
      f.input :rating, as: :select, collection: 1..5
    end
    f.actions
  end
end
