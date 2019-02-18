class User < ApplicationRecord
  has_one :nudie
  has_many :appointments

  has_many :nudies_as_canvases, class_name: 'Nudie', foreign_key: :canvas_id
end
