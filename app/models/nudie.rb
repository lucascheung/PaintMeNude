class Nudie < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :painters, through: :appointments, source: :user
end
