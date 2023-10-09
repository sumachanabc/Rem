class Condo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アソシエーション
  belongs_to :structure, class_name: 'Structure', foreign_key: 'structure_id'
  belongs_to :management_type, class_name: 'ManagementType', foreign_key: 'management_type_id'
  belongs_to :user

  # バリデーション
  validates :condo_name, presence: true
  validates :condo_address, presence: true
  validates :floor, presence: true
  validates :total_number_of_unit, presence: true
  validates :completion_year, presence: true
  validates :structure_id, presence: true
  validates :site_area, presence: true
  validates :total_floor_area, presence: true
  validates :management_type_id, presence: true
  validates :management_company_address, presence: true
  validates :management_company_name, presence: true
  validates :management_company_phone_number, presence: true
  validates :maintenance_fee, presence: true
  validates :repair_reserve_fund, presence: true

end
