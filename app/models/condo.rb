class Condo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アソシエーション
  belongs_to :structure, class_name: 'Structure', foreign_key: 'structure_id'
  belongs_to :management_type, class_name: 'ManagementType', foreign_key: 'management_type_id'
  belongs_to :user

  # バリデーション
  with_options presence: true do
    validates :condo_name
    validates :condo_address
    validates :floor
    validates :total_number_of_unit
    validates :completion_year
    validates :structure_id, numericality: { other_than: 1 }
    validates :site_area
    validates :total_floor_area
    validates :management_type_id, numericality: { other_than: 1 }
    validates :management_company_address
    validates :management_company_name
    validates :management_company_phone_number
    validates :maintenance_fee
    validates :repair_reserve_fund
  end
end
