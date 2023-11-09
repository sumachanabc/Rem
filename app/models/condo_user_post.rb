class CondoUserPost < ApplicationRecord
  belongs_to :condo
  belongs_to :condo_user
  has_many :condo_user_post_replies
  has_many :notifications, dependent: :destroy
  has_one_attached :image

  enum status: { unhandled: 0, in_progress: 1, completed: 2 }

  validates :title, presence: true
  validates :content, presence: true

  after_create :create_notification_for_user

  private

  def create_notification_for_user
    Rails.logger.info 'create_notification_for_userメソッドが呼び出されました。'
    user = self.condo_user.user

    notification = Notification.create(
      visitor_type: 'CondoUser',
      visitor_id: self.condo_user_id,
      visited_type: 'User',
      visited_id: user.id,
      condo_user_post_id: self.id,
      action: 'posted'
    )

    if notification.save
      Rails.logger.info '通知が正常に作成されました。'
    else
      Rails.logger.info "通知の作成に失敗しました: #{notification.errors.full_messages.join(", ")}"
    end
  end
end

