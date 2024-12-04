class AddCategoryIdToLegoSets < ActiveRecord::Migration[7.2]
  def change
    add_reference :lego_sets, :category, null: false, foreign_key: true
  end
end
