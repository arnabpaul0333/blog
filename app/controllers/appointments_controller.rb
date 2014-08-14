class AppointmentsController < ApplicationController

  def new
    @physician = Physician.find(params[:physician_id])
    @appointment = @physician.appointments.new
  end

  def create
    @physician = Physician.find(params[:physician_id])
    @appointment = @physician.appointments.create(appointment_params)
    redirect_to physician_appointment_path(@physician , @appointment)
  end

  def show
    @physician = Physician.find(params[:physician_id])
    @appointment = @physician.appointments.find(params[:id])
  end

  def edit
    @physician = Physician.find(params[:physician_id])
    @appointment = @physician.appointments.find(params[:id])
  end


  private
  def appointment_params
    params.require(:appointment).permit(:appointment ,:physician_id , :patient_id)
    end
end
