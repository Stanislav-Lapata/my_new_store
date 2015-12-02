class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.boolean :in_stock
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
