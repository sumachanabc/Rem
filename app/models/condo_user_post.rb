class CondoUserPost < ApplicationRecord
  belongs_to :condo
  belongs_to :condo_user
  has_many :condo_user_post_replies
  has_many :notifications, dependent: :destroy
  has_one_attached :image

  enum status: { unhandled: 0, in_progress: 1, completed: 2 }

  validates :title, presence: true
  validates :content, presence: true
end

