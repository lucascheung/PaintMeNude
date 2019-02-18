class User < ApplicationRecord
  has_one :nudie
  has_many :appointments

  has_many :nudies, through: appointments, as: :canvases
end
