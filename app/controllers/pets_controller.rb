class PetsController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :edit, :destroy, :update, :new]
  # before_action :authorize!, only: [:destroy, :update, :edit]

  def new
    @pet = Pet.new
  end

  def create
    @pet        = Pet.new pet_params
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet), notice: "Welcome to the Family!"
    else
      flash[:alert] = "Oopsie!"
      render :new
    end
  end

  def show

  end

  def index

  end

  def edit
  end

  def update
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  # def find_question
  #   @question = Question.friendly.find params[:id]
  # end

  def pet_params
    params.require(:pet).permit([:name, :breed, :sex, :birthday,
                                      :colour, :breeder, :image])
  end
  #
  # def authorize!
  #   redirect_to root_path, alert: 'access defined' unless can? :manage, @question
  # end

end
