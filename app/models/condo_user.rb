class CondoUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :condo
  belongs_to :user
  has_many :condo_user_post_replies
  has_many :contracts

  has_many :visited_notifications, as: :visited, class_name: 'Notification', dependent: :destroy
  has_many :visitor_notifications, as: :visitor, class_name: 'Notification', dependent: :destroy

  with_options presence: true do
    validates :room_number, format: { with: /\A\d+\z/, message: 'は数字のみで入力してください' }
    validates :condo_user_last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' }
    validates :condo_user_first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' }
    validates :condo_user_last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
    validates :condo_user_first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
    validates :condo_user_address
    validates :condo_user_phone_number, format: { with: /\A\d+\z/, message: 'は数字のみで入力してください' }
  end
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は英字と数字の両方を含む必要があります' }

  def full_name
    "#{condo_user_last_name} #{condo_user_first_name}"
  end

end
