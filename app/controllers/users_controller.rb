class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user, only: [:show]


  def index
    @radius_users = []
    @client = Client.new(client_params)



    # "address"=>"Paris, France", "couverture"=>"0", "ouverture"=>"1", "charpente"=>"0", "terrasse"=>"0", "plomberie"=>"0", "maison"=>"0", "immeuble"=>"1", "chateau"=>"0", "locaux_industriels"=>"0"

    pros = User.pro
    @users = pros.where.not(latitude: nil, longitude: nil).where.not(admin: true)
    # si on veut filtrer l'annuaire par mail à la palce d'admin==> && pros.where.not(email: 'contact@lestoitures.fr')
    if params[:client]
      if params[:client][:address]
        @radius_users = []
        @users.each do |user|
          beta = @client.distance_to(user.address).to_i
          if beta <= user.radius
            @radius_users << user
          end
        end
        @users = User.pro.where(id: @radius_users.map(&:id))
      end

      if params[:client][:couverture] == "1"
        @users = @users.where(couverture: true)
      end

      # a faire pour toutes infos

    end

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  def show
    @client = Client.new
    @projects = Project.where(user_id: @user)
    @label = []
    if @user.rge == true || @user.qualibat == true || @user.ffb == true || @user.mh == true
      @label = true
    end
  end

  def edit
     @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      if @user.pro? || @user.institution?
        redirect_to user_path(@user)
      else
        redirect_to annuaire_des_candidats_users_path
      end
    else
      render :edit
    end
  end

  def annuaire_des_candidats
    @need = Need.new
    @users = User.worker
  end

  private

  def user_params
    params.require(:user).permit(:company, :first_name, :last_name, :position, :mobile_phone, :office_phone, :email, :address, :description, :radius, :photo_company_logo, :photo_presentation, :construction, :renovation, :entretien, :charpente, :couverture, :ouverture, :terrasse, :plomberie, :maison, :chateau, :immeuble, :mh, :qualibat, :rge, :couvreur, :charpentier, :cv, :photo, :zip_code, :city, :locaux_industriels, :facebook, :ffb)
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone_number, :email, :address, :construction, :renovation, :entretien, :charpente, :couverture, :ouverture, :terrasse, :plomberie, :maison, :chateau, :immeuble, :monument_historique, :message, :locaux_industriels)
  end
end
