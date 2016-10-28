class PetPhotosController < ApplicationController
  def new
    @pet = Pet.find(params[:pet_id])
    # @pet_photo = PetPhoto.new(pet: @pet)
    @pet_photo = PetPhoto.new
  end

  def create
    @pet = Pet.find params[:pet_id]
    @pet_photo = PetPhoto.new pet_photo_params
    @pet_photo.pet = @pet
    add_more_images(pet_photo_params[:images])
    
    if @pet_photo.save
      flash[:alert] = "UUUUUUUU!"
      redirect_to pet_pet_photo_path(@pet, @pet_photo), notice: "Added!"
    else
      flash[:alert] = "Oopsie!"
      render :new
    end

  end

  def index
    @pet_photos = current_user.pets
    @pet_photo = PetPhoto.all
    if params[:lat]
      @pet_photos = PetPhoto.near([params[:lat], params[:lng]], 50, units: :km)
    else
      @pet_photos = PetPhoto.where.not(latitude: nil, longitude: nil).order(:created_at).limit(30)
    end
  end

  def show
    @pet_photo = PetPhoto.find params[:id]

  end

  private

  def pet_photo_params
    params.require(:pet_photo).permit(:caption, :date, :address, {images: []})
  end

  def add_more_images(new_images)
    images = @pet_photo.images
    images += new_images
    @pet_photo.images = images
  end

end
