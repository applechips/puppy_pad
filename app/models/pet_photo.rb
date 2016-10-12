class PetPhoto < ApplicationRecord
  belongs_to :pet

  geocoded_by :address
  after_validation :geocode

  mount_uploader :images, ImageUploader

end