class AddSuccesfullToTestPassage < ActiveRecord::Migration[7.0]
  def change
    add_column :test_passages, :successful, :boolean, null: false, default: false
  end
end
