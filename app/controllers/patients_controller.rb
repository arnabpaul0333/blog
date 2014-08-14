class PatientsController < ApplicationController
 
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(patient_params)
    redirect_to patient_path(@patient)
  end

  def show
    @patient = Patient.find(params[:id])
  end
  
  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    patient = Physician.find(params[:id])
    patient.update_attributes(patient_params)
    redirect_to patient_path(@patient)
  end
  
  private
  def patient_params
    params.require(:patient).permit(:name ,:address)
  end
end
