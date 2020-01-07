class AddDeteuserssToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :postcode, :string
    add_column :addresses, :house_num, :string
    add_column :addresses, :building_name, :string
  end
end
