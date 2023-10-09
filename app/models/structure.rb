class Structure < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'S造' },
    { id: 3, name: 'RC造' },
    { id: 4, name: 'SRC造' },
    { id: 5, name: 'その他' },
    { id: 6, name: '不明' }
  ]

  include ActiveHash::Associations
  has_many :condos
end
