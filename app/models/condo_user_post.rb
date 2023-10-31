class CondoUserPost < ApplicationRecord
  belongs_to :condo
  belongs_to :condo_user
  has_one_attached :image

  validates :title, presence: true
  validates :content, presence: true
end

