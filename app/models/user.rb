class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :condos
  has_many :condo_users
  has_many :condo_user_post_replies

  has_many :visited_notifications, as: :visited, class_name: 'Notification', dependent: :destroy
  has_many :visitor_notifications, as: :visitor, class_name: 'Notification', dependent: :destroy

  # roleを設定
  enum role: { employee: 0, admin: 1, manage: 2 }

  # 名前(全角)のバリデーション
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' }

  # 名前カナ(全角)のバリデーション
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }

  # パスワードの英数字混合チェック
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は英字と数字の両方を含む必要があります' }

end
