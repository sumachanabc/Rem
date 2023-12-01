class Parking < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :contracts, dependent: :destroy
  belongs_to :user
  belongs_to :condo
  belongs_to :vehicle_type, class_name: 'VehicleType', foreign_key: 'vehicle_type_id'
  belongs_to :parking_type, class_name: 'ParkingType', foreign_key: 'parking_type_id'
  belongs_to :special_category, class_name: 'SpecialCategory', foreign_key: 'special_category_id', optional: true
end
