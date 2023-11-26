class VehicleType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '車' },
    { id: 3, name: '自転車' },
    { id: 4, name: 'バイク' }
  ]

  include ActiveHash::Associations
  has_many :parkings
  has_many :contracts
end
