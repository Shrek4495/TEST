class AddIndexes < ActiveRecord::Migration[7.0]
  def change
    add_index :tests, %i[title level], unique: true
  end
end
