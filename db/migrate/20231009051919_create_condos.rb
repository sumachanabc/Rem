class CreateCondos < ActiveRecord::Migration[7.0]
  def change
    create_table :condos do |t|
      t.string  :condo_name,                      null: false
      t.string  :postal_code,                     null: false
      t.string  :condo_address,                   null: false
      t.integer :floor,                           null: false
      t.integer :basement_floor
      t.integer :total_number_of_unit,            null: false
      t.integer :completion_year,                 null: false
      t.integer :structure_id,                    null: false
      t.float   :site_area,                       null: false
      t.float   :total_floor_area,                null: false
      t.float   :maintenance_fee,                 null: false
      t.float   :repair_reserve_fund,             null: false

      t.string  :management_company_name,         null: false
      t.string  :management_company_postal_code,  null: false
      t.string  :management_company_address,      null: false
      t.string  :management_company_phone_number, null: false
      t.integer :management_type_id,              null: false

      t.references :user, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
