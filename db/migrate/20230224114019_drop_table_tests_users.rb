class DropTableTestsUsers < ActiveRecord::Migration[7.0]
  def up
    drop_table :tests_users, if_exists: true
  end
end
