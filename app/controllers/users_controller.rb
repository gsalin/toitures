class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user, only: [:show]


  def index
    @radius_users = []
    @client = Client.new

    pros = User.where(status:'pro')
    @users = pros.where.not(latitude: nil, longitude: nil)


    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  def show
    @client = Client.new
    @projects = Project.where(user_id: @user)
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   @user.save

  #   redirect_to users_path
  # end


  def edit
     @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.pro?
      redirect_to user_path(@user)
    else
      redirect_to annuaire_des_candidats_users_path
    end
  end

  def annuaire_des_candidats
    @need = Need.new
    @users = User.where(status:'worker')
  end

  private

  def user_params
    params.require(:user).permit(:company, :first_name, :last_name, :position, :mobile_phone, :office_phone, :email, :address, :description, :radius, :photo_company_logo, :photo_presentation, :construction, :renovation, :entretien, :charpente, :couverture, :ouverture, :terrasse, :plomberie, :maison, :chateau, :immeuble, :mh, :qualibat, :rge, :couvreur, :charpentier, :cv, :photo)
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
