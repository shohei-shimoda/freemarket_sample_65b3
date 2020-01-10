class Address < ApplicationRecord
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :postcode,                presence: {message: "郵便番号を入力してください"}
  validates :prefecture_id,           presence: {message: "選択してください"}
  validates :city,                    presence: {message: "市区町村を入力してください"}
  validates :house_num,               presence: {message: "番地を入力してください"}
end
