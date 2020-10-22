class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|

      t.timestamps

      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :prefectures_id, false
      t.integer :delivery_day_id, null: false
      t.integer :price, null: false
    end
  end
end
