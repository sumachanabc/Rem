class ManagementType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '全部委託' },
    { id: 3, name: '一部委託' }
  ]

  include ActiveHash::Associations
  has_many :condos
end