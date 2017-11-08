class JobAdsController < ApplicationController
    before_action :set_job_ad, only: [:edit, :update, :destroy]

  def index
    @need = Need.new
    @job_ads = JobAd.all
  end


  def new
    @job_ad = JobAd.new
  end


  def create
    @job_ad = JobAd.new(job_ad_params)
    @job_ad.user = current_user
    if @job_ad.save
      # redirect_to job_ads_path
      redirect_to job_ads_path
    else
      render :new
    end
  end


  def edit
    @job_ad.user = current_user
  end


  def update
    @user = current_user
    # if @user.update
    #   redirect_to espace_emploi_users_path(current_user)
    # else
    #   render :edit
    # end

    if @job_ad.user != current_user
      redirect_to root_path
    end

    if @job_ad.update(job_ad_params)
      redirect_to espace_emploi_users_path(current_user)
    else
      render :edit
    end
  end


  def destroy
    @job_ad.destroy
      redirect_to espace_emploi_users_path(current_user)
  end

  def mon_annonce
    @job_ads = current_user.job_ads
  end



  private



  def set_job_ad
    @job_ad = JobAd.find(params[:id])
  end

  def job_ad_params
    params.require(:job_ad).permit(
      :title,
      :diploma,
      :description,
      :experience,
      :remuneration,
      :cv,
      :profile_photo)
  end
end
