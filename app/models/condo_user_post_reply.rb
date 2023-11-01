class CondoUserPostReply < ApplicationRecord
  belongs_to :user
  belongs_to :condo_user_post

  has_one_attached :image

  validates :content, presence: true
end
