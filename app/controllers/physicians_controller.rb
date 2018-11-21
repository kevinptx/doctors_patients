class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:show, :destroy]

  def index
    @physicians = Physician.all
  end

  def show
  end

  def new
    @physician = Physician.create(physician_params)
    if @physician.save
      redirect_to @physician
    else
      render :new
    end
  end

  def destroy
    @physican.destroy
    redirect_to physicans_path
  end

  private

  def set_physician
    @physican = Physician.find(params[:id])
  end

  def physician_params
    params.require(:physican).permit(:name)
  end
end
