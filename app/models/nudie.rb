class Nudie < ApplicationRecord
  has_many :appointments
  belongs_to :user
  has_many :users, through: :appointments, as: :painters

  validates :weight, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
