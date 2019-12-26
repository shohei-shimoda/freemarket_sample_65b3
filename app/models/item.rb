class Item < ApplicationRecord
  belongs_to :category
  has_many :images

  # 親のレコードが削除された場合に、関連付いている子のレコードも一緒に削除してくれる
  accepts_nested_attributes_for :images, allow_destroy: true
end
