class JobOffersController < ApplicationController
  before_action :set_job_offer, only: [:edit, :update, :destroy]

  def index
    @job_offers = JobOffer.all
  end

  def show
    @job_offer = JobOffer.find(params[:id])
  end


  def new
    @job_offer = JobOffer.new
  end


  def create
    @job_offer = JobOffer.new(job_offer_params)
    @job_offer.user = current_user
    if @job_offer.save
      redirect_to job_offer_path(@job_offer)
    else
      render :new
    end
  end


  def edit
    if @job_offer.user != current_user
      redirect_to root_path
    end
  end


  def update
    @user = current_user
    # if @user.update
    #   redirect_to espace_emploi_users_path(current_user)
    # else
    #   render :edit
    # end

    if @job_offer.user != current_user
      redirect_to root_path
    end

    if @job_offer.update(job_offer_params)
      redirect_to job_offer_path
    else
      render :edit
    end
  end

  def destroy
    @job_offer.destroy
      redirect_to espace_emploi_users_path(current_user)
  end

  def mes_offres
    @job_offers = current_user.job_offers
  end

  private

  def set_job_offer
    @job_offer = JobOffer.find(params[:id])
  end

  def job_offer_params
    params.require(:job_offer).permit(
      :title,
      :job_type,
      :reference,
      :description,
      :contact_name,
      :contact_phone_number,
      :user_id,
      :mission,
      :profile,
      :diploma,
      :experience,
      :remuneration,
      :job_start_date_time)
  end

end
