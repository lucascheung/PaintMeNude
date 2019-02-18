class Appointment < ApplicationRecord
  belongs_to :nudie
  belongs_to :user

  validates :date, presence: true
  validates :location, presence: true
end
