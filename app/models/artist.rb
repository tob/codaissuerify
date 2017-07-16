class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :photos

  validates :name,    presence: true, length: { maximum: 30 }
  # validates :image_url,  presence: true
end
