class WorkersController < ApplicationController

  skip_before_action :authenticate_user!
  before_action :set_worker, only: [:edit, :update]

  def index
    @radius_workers = []
    @need = Need.new

    @workers = Worker.all
  end

  def edit
  end

  def update
    if @worker.update(worker_params)
      redirect_to workers_path
    else
      render :edit
    end
  end

  private

  def set_worker
    @worker = Worker.friendly.find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:email, :first_name, :last_name, :phone_number, :address, :cv, :photo, :couvreur, :charpentier)
  end
end
