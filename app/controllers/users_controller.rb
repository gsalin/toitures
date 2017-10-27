class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user, only: [:show]


  def index
    @radius_users = []
    @client = Client.new(client_params)
    selected_users = User.pro
    @users = selected_users.where.not(latitude: nil, longitude: nil).where.not(admin: true).where.not(office_phone: nil, description: nil, company: nil, address: nil, city: nil, zip_code: nil, first_name: nil, last_name: nil, email: nil)

    if params[:client]
      if params[:client][:address]
        @radius_users = []
        @client.geocode
        @users.each do |user|
          beta = @client.distance_to(user.address)
          if beta <= user.radius
            @radius_users << user
          end
        end

        if @radius_users.count >= 1
          @final_users = User.pro.where(id: @radius_users.map(&:id))
        else
          @final_users = @users
          @declaration = "Il n'y a pas encore de professionnel enregistré sur LesToitures.fr dans votre région. Nous avons donc affiché l'ensemble des professionnels"
        end
        @final_users
      end
    else
      @final_users = @users
    end

    @hash = Gmaps4rails.build_markers(@final_users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end

  end

      # Ancien Code
      # if params[:client][:couverture] == "1"
      #   @users = @users.where(couverture: true)
      # end
      # if params[:client][:ouverture] == "1"
      #   @users = @users.where(ouverture: true)
      # end
      # if params[:client][:charpente] == "1"
      #   @users = @users.where(charpente: true)
      # end
      # if params[:client][:terrasse] == "1"
      #   @users = @users.where(terrasse: true)
      # end
      # if params[:client][:plomberie] == "1"
      #   @users = @users.where(plomberie: true)
      # end
      # if params[:client][:architecte] == "1"
      #   @users = @users.where(architecte: true)
      # end
      # if params[:client][:isolation] == "1"
      #   @users = @users.where(isolation: true)
      # end
      # if params[:client][:maison] == "1"
      #   @users = @users.where(maison: true)
      # end
      # if params[:client][:chateau] == "1"
      #   @users = @users.where(chateau: true)
      # end
      # if params[:client][:immeuble] == "1"
      #   @users = @users.where(immeuble: true)
      # end
      # if params[:client][:locaux_industriels] == "1"
      #   @users = @users.where(locaux_industriels: true)
      # end
      # if params[:client][:batiment_agricole] == "1"
      #   @users = @users.where(batiment_agricole: true)
      # end



  def show
    @client = Client.new
    @projects = Project.where(user_id: @user)
    @articles = Article.where(user_id: @user)
    @label = []
    if @user.rge == true || @user.qualibat == true || @user.ffb == true || @user.mh == true || @user.epv == true || @user.capeb == true || @user.rge_eco_artisan == true || @user.mof == true
      @label = true
    end
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
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
      cleanup_new_photo_ids
      render :edit
    end
  end

  def annuaire_des_candidats
    @need = Need.new
    @users = User.worker
  end

  private

  def cleanup_new_photo_ids
    if @user.photo_presentation && @user.photo_presentation.new_record?
      @user.photo_presentation.id = nil
    end

    if @user.photo_company_logo && @user.photo_company_logo.new_record?
      @user.photo_company_logo.id = nil
    end
  end

  def user_params
    params.require(:user).permit(
      :company,
      :first_name,
      :last_name,
      :position,
      :mobile_phone,
      :office_phone,
      :email,
      :address,
      :description,
      :radius,
      :photo_company_logo,
      :photo_presentation,
      :construction,
      :renovation,
      :entretien,
      :charpente,
      :couverture,
      :ouverture,
      :terrasse,
      :plomberie,
      :architecte,
      :isolation,
      :specialite1,
      :specialite2,
      :specialite3,
      :maison,
      :chateau,
      :immeuble,
      :locaux_industriels,
      :batiment_agricole,
      :mh,
      :qualibat,
      :rge,
      :epv,
      :capeb,
      :rge_eco_artisan,
      :mof,
      :artisan,
      :maitre_artisan,
      :artisan_d_art,
      :couvreur,
      :charpentier,
      :cv,
      :photo,
      :zip_code,
      :city,
      :facebook,
      :ffb,
      :website,
      :twitter,
      :linkedin,
      :press_link_1,
      :press_link_title_1,
      :press_link_2,
      :press_link_title_2,
      :press_link_3,
      :press_link_title_3,
    )
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def client_params
    return {} unless params[:client]
    params.require(:client).permit(
      :address,
      :couverture,
      :ouverture,
      :charpente,
      :terrasse,
      :plomberie,
      :isolation,
      :architecte,
      :maison,
      :chateau,
      :immeuble,
      :locaux_industriels,
      :batiment_agricole
    )
  end
end
