class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.references :lego_set, null: false, foreign_key: true
      t.string :name
      t.text :review
      t.integer :rating

      t.timestamps
    end
  end
end
