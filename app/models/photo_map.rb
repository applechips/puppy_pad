class PhotoMap < ApplicationRecord
  attr_accessor :address, :latitude, :longitude
  
  belongs_to :pet
  has_many :pet_photos

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
