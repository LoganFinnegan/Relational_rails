class CreateOrder < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :item_name
      t.integer :model
      t.boolean :shipped
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
