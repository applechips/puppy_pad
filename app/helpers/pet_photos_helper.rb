module PetPhotosHelper
  def pet_photos_json(pet_photos_json)
    @markers = Gmaps4rails.build_markers(pet_photos_json) do |pet_photo, marker|
      marker.lat        pet_photo.latitude
      marker.lng        pet_photo.longitude
    end
  end
end
