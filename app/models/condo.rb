class Condo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アソシエーション
  belongs_to :structure, class_name: 'Structure', foreign_key: 'structure_id'
  belongs_to :management_type, class_name: 'ManagementType', foreign_key: 'management_type_id'
  belongs_to :user

  # バリデーション
  with_options presence: true do
    validates :condo_name
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' } # 数字3桁、ハイフン、数字4桁の並びのみ許可する
    validates :condo_address
    validates :floor, numericality: { only_integer: true, less_than_or_equal_to: 999 }
    validates :total_number_of_unit, numericality: { only_integer: true, less_than_or_equal_to: 9999 }
    validates :completion_year, numericality: { only_integer: true, less_than_or_equal_to: 999 }
    validates :structure_id, numericality: { other_than: 1 }
    validates :site_area
    validates :total_floor_area
    validates :maintenance_fee
    validates :repair_reserve_fund
    validates :management_company_name
    validates :management_company_postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' } # 数字3桁、ハイフン、数字4桁の並びのみ許可する
    validates :management_company_address
    validates :management_company_phone_number, format: { with: /\A\d+\z/, message: 'は数字のみで入力してください' }
    validates :management_type_id, numericality: { other_than: 1 }
  end
end