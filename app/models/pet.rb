class Pet < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true

  belongs_to :user
  belongs_to :vet
  has_many :pet_photos
  has_many :medical_records

  mount_uploader :image, ImageUploader

end
