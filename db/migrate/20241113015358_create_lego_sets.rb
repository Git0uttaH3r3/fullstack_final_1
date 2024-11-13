class CreateLegoSets < ActiveRecord::Migration[7.2]
  def change
    create_table :lego_sets do |t|
      t.string :set_id
      t.string :title
      t.string :image
      t.decimal :price
      t.decimal :average_rating

      t.timestamps
    end
  end
end
