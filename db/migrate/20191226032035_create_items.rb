class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, index: true, null: false
      t.text :description, null: false
      t.integer :condition, null: false
      t.references :category, null: false
      t.integer :size, null: false
      t.integer :brand
      t.integer :delivery_charge, null: false
      t.integer :delivery_area, null: false
      t.integer :delivery_days, null: false
      t.integer :price, null: false
      t.integer :status, null: false
      t.integer :seller_id, null: false
      t.integer :buyer_id, null: false
      t.integer :image_id, null: false

      t.timestamps
    end
  end
end
