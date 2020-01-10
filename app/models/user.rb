class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cards
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :items
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
end
