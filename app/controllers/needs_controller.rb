class NeedsController < ApplicationController

  skip_before_action :authenticate_user!

  before_action :set_need, only: [:show, :edit, :update]

  def new
    @need = Need.new
  end

  def create
    @need = Need.new(need_params)
    @need.save
    if @need.address == ""
      redirect_to annuaire_des_candidats_users_path
    else
      redirect_to need_path(@need)
    end
  end

  def show
    @radius_workers = []
    User.where(status:'worker').each do |worker|
      beta = @need.distance_to(worker.address).to_i
      if beta < 100
        @radius_workers << worker
      end
    end

    @selected_workers = []
    @radius_workers.each do |radius_worker|
      if @need.couvreur == true && radius_worker.couvreur == true
        @selected_workers << radius_worker
      elsif @need.charpentier == true && radius_worker.charpentier == true
        @selected_workers << radius_worker
      end
    end
  end

  def edit
    # Ne pas supprimer, set_need ci dessous
  end

  def update
    @need.update(need_params)

    redirect_to need_path(@need)
  end

  private

  def authenticate_any
    if current_worker.present?
      authenticate_worker!
    elsif current_user.present?
      authenticate_user!
    end
  end

  def need_params
    params.require(:need).permit(:address, :couvreur, :charpentier)
  end

  def set_need
    @need = Need.find(params[:id])
  end
end
