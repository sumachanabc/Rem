class DocumentCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '総会資料' },
    { id: 3, name: '総会議事録' },
    { id: 4, name: '理事会資料' },
    { id: 5, name: '理事会議事録' },
    { id: 6, name: '竣工図' },
    { id: 7, name: '長期修繕計画' }
  ]

  include ActiveHash::Associations
  has_many :documents
end
