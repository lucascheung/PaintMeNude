class Nudie < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :appointments
  has_many :painters, through: :appointments, source: :user

  validates :weight, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :user, presence: true
end
