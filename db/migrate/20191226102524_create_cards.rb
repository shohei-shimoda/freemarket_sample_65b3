class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :user,               null: false
      t.integer :card_num,              null: false
      t.integer :limit_mouth,           null: false
      t.integer :limit_year,            null: false
      t.integer :security_code,         null: false

      t.timestamps
    end
  end
end
