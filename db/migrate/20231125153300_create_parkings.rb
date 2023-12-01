class CreateParkings < ActiveRecord::Migration[7.0]
  def change
    create_table :parkings do |t|
      t.references :user,             null: false, foreign_key: true
      t.references :condo,            null: false, foreign_key: true
      t.string :parking_number,       null: false
      t.integer :vehicle_type_id,     null: false
      t.integer :monthly_fee,         null: false
      t.integer :parking_type_id,     null: false
      t.boolean :roof,                null: false, default: false
      t.integer :special_category_id, null: true

      t.timestamps
    end
  end
end
