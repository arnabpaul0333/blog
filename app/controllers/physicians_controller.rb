class PhysicianController < ApplicationController

  def new
    @physician = Physician.new
    end

  def create
    @physician = Physician.create(physician_params)
    redirect_to physician_path(@physician) 
  end

  def show
    @physician=Physician.find(params[:id])
  end
  
  private
  def physician_params
    params.require(:physician).permit(:name,:address)
  end
end
