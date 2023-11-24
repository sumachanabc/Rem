class Document < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :condo
  has_one_attached :file
  belongs_to :document_category, class_name: 'DocumentCategory', foreign_key: 'category_id'

end
