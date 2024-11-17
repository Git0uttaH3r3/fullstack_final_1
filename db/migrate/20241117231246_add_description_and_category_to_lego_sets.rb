class AddDescriptionAndCategoryToLegoSets < ActiveRecord::Migration[7.2]
  def change
    add_column :lego_sets, :description, :text
    add_column :lego_sets, :category, :string
  end
end
