class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name, :username
    remove_column :users, :email 
    change_column_null :users, :username, false
  end
end