class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :file, null: false
      t.string :reason, null: false, default: :Reason
      t.string :rule_type, null: false, default: ''
      t.string :rule_value, null: false, default: ''
      t.references


      t.timestamps
    end
  end
end
