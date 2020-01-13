class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :sns_credentials, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :cards
         

  has_one :address, dependent: :destroy
  has_many :items,dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :items
  
  VALID_PHONE = /\A\d{10,11}\z/
  VALID_postal = /\A[0-9]{3}-[0-9]{4}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # new入力項目
  validates :nickname,                presence: {message: "ニックネームを入力してください"}, uniqueness: { case_sensitive: false }, length: {maximum: 20}, on: :validates_new
  validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, on: :validates_new
  validates :password,                presence: true, length: {minimum: 7, maximum: 30}, on: :validates_new
  validates :last_name,               presence: {message: "姓を入力してください"}, length: {maximum: 20}, on: :validates_new
  validates :first_name,              presence: {message: "名を入力してください"}, length: {maximum: 20}, on: :validates_new
  validates :last_name_kana,          presence: {message: "姓カナを入力してください"}, length: {maximum: 20}, on: :validates_new
  validates :first_name_kana,         presence: {message: "名カナを入力してください"}, length: {maximum: 20}, on: :validates_new
  validates :birthday_year,           presence: true, on: :validates_new
  validates :birthday_month,          presence: true, on: :validates_new
  validates :birthday_day,            presence: true, on: :validates_new
  
  # signup3入力項目
  validates :phone_num,            presence: true, format: { with: VALID_PHONE}, on: :validates_signup3

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present? #sns登録のみ完了してるユーザー
      user = User.where(id: snscredential.user_id).first
      unless user.present? #ユーザーが存在しないなら
        user = User.new(
          # snsの情報
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential

    else #sns登録 未
      user = User.where(email: auth.info.email).first
      if user.present? #会員登録 済
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else #会員登録 未
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
      end
    end
    # hashでsnsのidを返り値として保持しておく
    return { user: user , sns_id: sns.id }
  end
end
