class CondoUserPostReply < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :condo_user, optional: true
  belongs_to :condo_user_post
  has_many :notifications, dependent: :destroy, foreign_key: :condo_user_post_reply_id

  has_one_attached :image

  validates :content, presence: true

  after_create :create_notification_for_comment

  private

  def create_notification_for_comment
    post = self.condo_user_post
    sender = self.user || self.condo_user
    recipient = self.user ? post.condo_user : post.condo_user.user

    Notification.create!(
      visitor_type: sender.class.name,
      visitor_id: sender.id,
      visited_type: recipient.class.name,
      visited_id: recipient.id,
      condo_user_post_reply_id: self.id,
      action: 'comment'
    )
  end
end