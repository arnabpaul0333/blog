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
  
  def edit
    @physician = Physician.find(params[:id])
  end
  
  def update
    physician = Physician.find[:id])
    physician.update_attributes(physician_params)
    redirect_to physician_path(@physician)
  end

   private
   def physician_params
   params.require(:physician).permit(:name,:address)
  end
end
