class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address, dependent: :destroy
  has_many :items,dependent: :destroy
  accepts_nested_attributes_for :address

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
  
  # signup3入力項目 ハイフン有りの場合はエラーメッセージすること必要
  validates :phone_num,            presence: true, format: { with: VALID_PHONE}, on: :validates_signup3


end
