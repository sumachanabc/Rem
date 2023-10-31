class CondoUserPost < ApplicationRecord
  belongs_to :condo_user

  validates :title, presence: true
  validates :content, presence: true
end

