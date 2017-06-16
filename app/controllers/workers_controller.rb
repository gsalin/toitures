class WorkersController < ApplicationController

  skip_before_action :authenticate_worker!, only: [:index, :show]
  skip_before_action :authenticate_user!
  before_action :set_worker, only: [:edit, :update]

  def index
    @workers = Worker.all
  end

  def show

  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])

    if @worker.update(worker_params)
      redirect_to worker_path(@worker)
    else
      render :edit
    end
  end

  private

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:email, :first_name, :last_name, :phone_number, :address, :cv, :photo)
  end

end
