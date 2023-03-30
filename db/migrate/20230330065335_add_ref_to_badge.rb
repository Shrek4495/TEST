class AddRefToBadge < ActiveRecord::Migration[7.0]
  def change
    add_reference :badges, :users, foreign_key: true
  end
end
