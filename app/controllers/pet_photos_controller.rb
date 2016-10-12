class PetPhotosController < ApplicationController
  def new
    @pet = Pet.find(params[:pet_id])
    @pet_photo = PetPhoto.new(pet: @pet)
  end

  def create
    byebug
    @pet = Pet.find params[:pet_id]
    @pet_photo = PetPhoto.new pet_photo_params
    @pet_photo.pet = @pet

    byebug
    if @pet_photo.save
      redirect_to pet_pet_photo_path(@pet, @pet_photo), notice: "Added!"
    else
      flash[:alert] = "Oopsie!"
      render :new
    end

  end

  def index
    @pet_photo = PetPhoto.all
  end

  def show
  end

  private

  def pet_photo_params
    params.require(:pet_photo).permit(:caption, :date, :images, :address)
  end

end
