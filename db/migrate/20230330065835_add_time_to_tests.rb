class AddTimeToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :time, :integer, null: false, default: 1
  end
end
