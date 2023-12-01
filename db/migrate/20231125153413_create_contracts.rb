class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.integer :vehicle_type_id,   null: true
      t.string :vehicle_model_code, null: true
      t.string :vehicle_number,     null: true
      t.date :start_date,           null: false
      t.date :end_date,             null: false
      t.references :user,           null: false, foreign_key: true
      t.references :condo,          null: false, foreign_key: true
      t.references :condo_user,     null: false, foreign_key: true
      t.references :parking,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
