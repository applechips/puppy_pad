class PetsController < ApplicationController
  before_action :authenticate_user!
  include TwilioHelper
  
  def new
    @pet = Pet.new
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
  end

  def index

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
