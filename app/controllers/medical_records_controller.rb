class MedicalRecordsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @medical_record = MedicalRecord.new
    @pet = Pet.find params[:pet_id]
  end

  def create
    @pet = Pet.find params[:pet_id]
    @medical_record = MedicalRecord.new medical_record_params
    @medical_record.pet = @pet

    if @medical_record.save
      redirect_to pet_medical_records_path(@medical_record), notice: "Added!"
    else
      flash[:alert] = "Oopsie!"
      render :new
    end
  end

  def show
  end

  def index
    @weight = []
    @date = []
    @medical_record = MedicalRecord.all
    @pet = Pet.find params[:pet_id]
    record = @pet.medical_records.order(date: :asc)
    record.each do |r|
      if r.weight.nil?
        else
          @weight.push(r.weight)
          @date.push(r.date.to_s)
      end
    end
    p @date

    @pets = current_user.pets
    render layout: 'navbar-pets'
  end

  def destroy
  end

  private

  def medical_record_params
    params.require(:medical_record).permit(:date, :condition_procedure, :charges, :weight)
  end

end
