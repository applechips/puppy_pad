class WeightsController < ApplicationController
  def index
    @weights = Weight.all
  end

  def new
    @weight = Weight.new

  end

  def create
    @pet = Pet.find params[:pet_id]
    @weight = Weight.new weight_params
    @bid.auction = @auction
    @pet.user = current_user

    if @pweight.save
      redirect_to pet_weights_path(@weight), notice: "Added!"
    else
      flash[:alert] = "Oopsie!"
      render :new
    end

  end

  def show
    @weight = Weight.find params[:id]
  end

  def destroy
  end

  private

  def weight_params
    params.require(:weight).permit(:weight, :date)
  end

end
