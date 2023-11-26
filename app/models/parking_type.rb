class ParkingType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '平置き' },
    { id: 3, name: '機械式' }
  ]

  include ActiveHash::Associations
  has_many :parkings
end
