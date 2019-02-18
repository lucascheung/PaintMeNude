class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :nudie
  validates :appointment_date, presence: true
  validates :location, presence: true
  validates :user, presence: true
  validates :nudie, presence: true
end
