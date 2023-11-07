class CondoUserPostReply < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :condo_user, optional: true
  belongs_to :condo_user_post

  has_one_attached :image

  validates :content, presence: true
end
