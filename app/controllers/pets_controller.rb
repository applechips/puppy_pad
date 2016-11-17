class PetsController < ApplicationController
  before_action :authenticate_user!
  include TwilioHelper

  def new
    @pet = Pet.new
    @pets = current_user.pets
    render layout: 'navbar-pets'
  end

  def create
    @pet        = Pet.new pet_params
    @pet.user   = current_user

    if @pet.save
      redirect_to pet_path(@pet), notice: "Welcome to the Family!"
    else
      flash[:alert] = "Oopsie!"
      render :new
    end
  end

  def show
    @pet = Pet.find params[:id]
    @pets = current_user.pets

    @pet_photos = current_user.pets
    @pet_photo = @pets.map(&:image)

    @all_records = []
    @pets.each do |p|
      p.pet_photos.each do |pp|
        @all_records << {:date => pp.date, :id=> pp.id, :activity => pp.caption, :images => pp.images, :type => "Activity" }

      end
      p.medical_records.each do |m|
        @all_records << {:date => m.date, :id => m.id, :activity => m.condition_procedure, :type => "Vet" }

      end
    end
    new_array = @all_records.sort_by { |ar| ar[:id] }
    puts new_array


    render layout: 'navbar-features'
  end

  def index
    @pets = current_user.pets

    # PET PHOTOS
    @pet_photos = current_user.pets
    @pet_photo = @pets.map(&:image)

    if params[:lat]
      @pet_photos = PetPhoto.near([params[:lat], params[:lng]], 50, units: :km)
    else
      @pet_photos = PetPhoto.where.not(latitude: nil, longitude: nil).order(:created_at).limit(30)
    end

    # MEDICAL RECORDS
    @all_records = []
    @pets.each do |p|
      p.pet_photos.each do |pp|
        @all_records << {:date => pp.date, :id=> pp.id, :activity => pp.caption, :images => pp.images, :type => "Activity" }

      end
      p.medical_records.each do |m|
        @all_records << {:date => m.date, :id => m.id, :activity => m.condition_procedure, :type => "Vet" }

      end
    end
    new_array = @all_records.sort_by { |ar| ar[:id] }
    puts new_array

    render layout: 'navbar-pets'
  end

  def edit
    @pet = Pet.find params[:id]
    send_SMS
  end

  def update
    @pet       = Pet.find params[:id]
    if @pet.update pet_params
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit([:name, :breed, :sex, :birthday,
                                      :colour, :breeder, :image])
  end



end
