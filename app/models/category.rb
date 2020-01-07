class Category < ApplicationRecord
  has_many   :items   ,dependent: :destroy
  has_many :items
  has_ancestry
end
