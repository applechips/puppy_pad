class MedicalRecordsController < ApplicationController

  def new
    @medical_record = MedicalRecord.new
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
    @medical_record = MedicalRecord.all
  end

  def destroy
  end

  private

  def medical_record_params
    params.require(:medical_record).permit(:date, :condition_procedure, :charges, :weight)
  end

end
