class AddNotNullToCorrect < ActiveRecord::Migration[5.2]
  def change
    change_column_null :answers, :correct, false
  end
end