class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :item_id, null: false
      t.text :image, null: false

      t.timestamps
    end
  end
end
