class Nudie < ApplicationRecord
  has_many :appointments
  belongs_to :user
  has_many :monkeys, through: :appointments, class_name: 'User', foreign_key: :user_id

  validates :weight, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
