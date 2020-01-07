class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :sns_credentials, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
end

def self.find_oauth(auth)
  uid = auth.uid
  provider = auth.provider
  snscredential = SnsCredential.where(uid: uid, provider: provider).first
  # binding.pry

  if snscredential.present? #sns登録のみ完了してるユーザー
    user = User.where(id: snscredential.user_id).first
    unless user.present? #ユーザーが存在しないなら
      user = User.new(
        # snsの情報
        # binding.pry => auth.infoとかで確認 
        nickname: auth.info.name,
        email: auth.info.email
      )
    end
    sns = snscredential
    #binding.pry

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
      # binding.pry
      sns = SnsCredential.create(
        uid: uid,
        provider: provider
      )
      # binding.pry 
    end
  end
  # binding.pry
  # hashでsnsのidを返り値として保持しておく
  return { user: user , sns_id: sns.id }
end