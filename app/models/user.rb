class User < ApplicationRecord
  has_one :nudie
  has_many :appointments

  has_many :nudies_as_canvases, through: :appointments, class_name: 'Nudie', foreign_key: :nudie_id
end
