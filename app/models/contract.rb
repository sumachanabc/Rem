class Contract < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condo_user
  belongs_to :condo
  belongs_to :vehicle_type, class_name: 'VehicleType', foreign_key: 'vehicle_type_id', optional: true
end
