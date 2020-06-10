class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :birth_year_id, :birth_month_id, :birth_day_id, presence: true

  has_many :messages
  has_many :stores
  has_many :group_users
  has_many :groups, through: :group_users

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7 }
  validates :first_name, :last_name, presence: true,
  format: {
    with: /\A[一-龥ぁ-ん]/,
    message: "全角のみで入力して下さい"
  }
  validates :first_name_kana, :last_name_kana, presence: true,
  format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birth_year
  belongs_to_active_hash :birth_month
  belongs_to_active_hash :birth_day
end
