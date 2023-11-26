class SpecialCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '来客用' },
    { id: 3, name: '身障者用' },
  ]

  include ActiveHash::Associations
  has_many :parkings
end
