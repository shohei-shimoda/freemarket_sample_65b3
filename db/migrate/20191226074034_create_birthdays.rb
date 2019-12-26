class CreateBirthdays < ActiveRecord::Migration[5.2]
  def change
    create_table :birthdays do |t|
      t.integer :birthday_year
      t.integer :birthday_month
      t.integer :birthday_day

      t.timestamps
    end
  end
end
