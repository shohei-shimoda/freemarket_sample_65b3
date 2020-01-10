class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user,               null: false
      t.string :postcode,               null: false
      t.integer :prefecture_id,         null: false
      t.string :city,                   null: false  
      t.string :house_num,              null: false
      t.string :building_name
      t.string :address_phone_num

      t.timestamps
    end
  end
end
