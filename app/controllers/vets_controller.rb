class VetsController < ApplicationController
  def new
    @vet = Vet.new
    # render layout: 'navbar-features'
  end

  def create
    @vet = Vet.new vet_params
    @vet.user = current_user
    if @vet.save
      redirect_to vet_path(@vet), notice: "Saved"
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

  private

  def vet_params
    params.require(:vet).permit(:name, :address, :phone_number, :postal_code, :city, :province_state, :country, :dr_name)
  end

end
