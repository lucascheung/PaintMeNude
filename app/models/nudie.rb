class Nudie < ApplicationRecord
  has_many :appointments
  belongs_to :user
  has_many :users_as_painters, class_name: 'User', foreign_key: :painter_id

  validates :weight, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
