class RemoveAuthorsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :address_id, :references,  null: false
  end
end
