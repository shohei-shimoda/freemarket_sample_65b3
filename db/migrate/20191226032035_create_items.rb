class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, index: true, null: false
      t.text :description, null: false
      t.integer :condition, null: false
      t.references :category, null: false
      t.integer :child_category
      t.integer :grandchild_category
      t.integer :size
      t.integer :brand
      t.integer :delivery_charge, null: false
      t.integer :delivery_area, null: false
      t.integer :delivery_days, null: false
      t.integer :price, null: false
      t.integer :status, null: false,default: 0
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :image_id
      t.timestamps
    end
  end
end
