class ChangeAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :name
    change_column_null :users, :email, false
  end
end
