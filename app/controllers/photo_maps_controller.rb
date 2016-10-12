class PhotoMapsController < ApplicationController
  def show
    @pet = Pet.find params[:id, :pet_id]
  end
end
