class WorkersController < ApplicationController

  skip_before_action :authenticate_user!
  skip_before_action :authenticate_worker!, only: [:index]
  # before_action :authenticate_any!, only: [:index]
  before_action :set_worker, only: [:edit, :update]

  def index
    @radius_workers = []
    @need = Need.new

    @workers = Worker.all
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])

    if @worker.update(worker_params)
      redirect_to workers_path
    else
      render :edit
    end
  end

  private

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:email, :first_name, :last_name, :phone_number, :address, :cv, :photo, :couvreur, :charpentier)
  end

  def authenticate_any!
    if current_worker.present?
      authenticate_worker!
    elsif current_user.present?
      authenticate_user!
    end
  end

end
