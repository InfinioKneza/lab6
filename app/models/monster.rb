class Monster < ApplicationRecord
  validates :name, :birthdate, presence: true
  has_one_attached :image

end
