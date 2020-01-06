class Birthday < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birthday_year
  belongs_to_active_hash :birthday_month
  belongs_to_active_hash :birthday_day
end