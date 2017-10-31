class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user, only: [:show]


  def index
    @client = Client.new(client_params)
    @radius_users = []
    @final_users = []
    pro_users = User.pro
    users = pro_users.where.not(latitude: nil, longitude: nil).where.not(admin: true).where.not(office_phone: nil, description: nil, company: nil, address: nil, city: nil, zip_code: nil, first_name: nil, last_name: nil, email: nil)
    # Cas ou le client ne renseigne rien dans le formulaire

    if params[:client] == nil || params[:client][:address] == nil || params[:client][:address] == ""
      if params[:client] == nil
        @final_users = users
      elsif params[:client] != nil && params[:client][:couverture] == "0" && params[:client][:ouverture] == "0" && params[:client][:charpente] == "0" && params[:client][:terrasse] == "0" && params[:client][:plomberie] == "0" && params[:client][:architecte] == "0" && params[:client][:isolation] == "0" && params[:client][:maison] == "0" && params[:client][:chateau] == "0" && params[:client][:immeuble] == "0" && params[:client][:locaux_industriels] == "0" && params[:client][:batiment_agricole] == "0"
        @final_users = users
        @declaration = "Voici les professionnels référencés sur notre site, précisez un lieu et au moins 1 spécialité pour affiner votre recherche"
      else
        selection_of_users = []
        users.each do |user|
          if params[:client][:couverture] == "1"  && user.couverture == true && selection_of_users.include?(user) == false
            selection_of_users << user
          end
          if params[:client][:ouverture] == "1" && user.ouverture == true && selection_of_users.include?(user) == false
            selection_of_users << user
          end
          if params[:client][:charpente] == "1" && user.charpente == true && selection_of_users.include?(user) == false
            selection_of_users << user
          end
          if params[:client][:terrasse] == "1" && user.terrasse == true && selection_of_users.include?(user) == false
            selection_of_users << user
          end
          if params[:client][:plomberie] == "1" && user.plomberie == true && selection_of_users.include?(user) == false
            selection_of_users << user
          end
          if params[:client][:architecte] == "1" && user.architecte == true && selection_of_users.include?(user) == false
            selection_of_users << user
          end
          if params[:client][:isolation] == "1" && user.isolation == true && selection_of_users.include?(user) == false
            selection_of_users << user
          end
          if params[:client][:maison] == "1" && user.maison == true && selection_of_users.include?(user) == false
            selection_of_users << user
          end
          if params[:client][:chateau] == "1" && user.chateau == true && selection_of_users.include?(user) == false
            selection_of_users << user
          end
          if params[:client][:immeuble] == "1" && user.immeuble == true && selection_of_users.include?(user) == false
            selection_of_users << user
          end
          if params[:client][:locaux_industriels] == "1" && user.locaux_industriels == true && selection_of_users.include?(user) == false
            selection_of_users << user
          end
          if params[:client][:batiment_agricole] == "1" && user.batiment_agricole == true && selection_of_users.include?(user) == false
            selection_of_users << user
          end
        end
        @final_users = selection_of_users
        @declaration = "Voici les professionnels francais répondants à vos besoins, précisez l'adresse de vos travaux afin d'affiner votre recherche"
      end
    else
      # Calcul de la distance entre le pro et le client
      @radius_users = []
      @client.geocode
      users.each do |user|
        beta = @client.distance_to(user.address).to_i
        if beta <= user.radius
          @radius_users << user
        end
      end

      if params[:client][:couverture] == "0" && params[:client][:ouverture] == "0" && params[:client][:charpente] == "0" && params[:client][:terrasse] == "0" && params[:client][:plomberie] == "0" && params[:client][:architecte] == "0" && params[:client][:isolation] == "0" && params[:client][:maison] == "0" && params[:client][:chateau] == "0" && params[:client][:immeuble] == "0" && params[:client][:locaux_industriels] == "0" && params[:client][:batiment_agricole] == "0"
        if @radius_users.count >= 1
          @final_users = User.pro.where(id: @radius_users.map(&:id))
          @declaration = "Voici tous les professionnels près de chez vous, vous pouvez préciser votre recherche en completant le formulaire (autre champs que l'adresse)."
        else
          @final_users = users
          @declaration = "Il n'y a pas encore de professionnel enregistré sur LesToitures.fr pouvant intervenir dans votre secteur."
        end
      else
        if @radius_users.count >= 1
          @final_users = User.pro.where(id: @radius_users.map(&:id))
          selection_of_users = []
          @final_users.each do |user|
            if params[:client][:couverture] == "1"  && user.couverture == true && selection_of_users.include?(user) == false
              selection_of_users << user
            end
            if params[:client][:ouverture] == "1" && user.ouverture == true && selection_of_users.include?(user) == false
              selection_of_users << user
            end
            if params[:client][:charpente] == "1" && user.charpente == true && selection_of_users.include?(user) == false
              selection_of_users << user
            end
            if params[:client][:terrasse] == "1" && user.terrasse == true && selection_of_users.include?(user) == false
              selection_of_users << user
            end
            if params[:client][:plomberie] == "1" && user.plomberie == true && selection_of_users.include?(user) == false
              selection_of_users << user
            end
            if params[:client][:architecte] == "1" && user.architecte == true && selection_of_users.include?(user) == false
              selection_of_users << user
            end
            if params[:client][:isolation] == "1" && user.isolation == true && selection_of_users.include?(user) == false
              selection_of_users << user
            end
            if params[:client][:maison] == "1" && user.maison == true && selection_of_users.include?(user) == false
              selection_of_users << user
            end
            if params[:client][:chateau] == "1" && user.chateau == true && selection_of_users.include?(user) == false
              selection_of_users << user
            end
            if params[:client][:immeuble] == "1" && user.immeuble == true && selection_of_users.include?(user) == false
              selection_of_users << user
            end
            if params[:client][:locaux_industriels] == "1" && user.locaux_industriels == true && selection_of_users.include?(user) == false
              selection_of_users << user
            end
            if params[:client][:batiment_agricole] == "1" && user.batiment_agricole == true && selection_of_users.include?(user) == false
              selection_of_users << user
            end
          end
          @final_users = selection_of_users
          @declaration = "Voici tous les professionnels près de chez vous et répondant à vos besoins."
        else
          @final_users = users
          @declaration = "Désolé, il n'y a pas encore de professionnel correspondant à vos besoins et pouvant intervenir dans votre secteur."
        end
      end
    end

    @hash = Gmaps4rails.build_markers(@final_users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end


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
