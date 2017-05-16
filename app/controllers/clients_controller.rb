class ClientsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :set_client, only: [:show, :edit, :update]

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.save

    if @client.address == ""
      redirect_to users_path
    else
      redirect_to client_path(@client)
    end
  end

  def show
    @client = Client.find(params[:id])
    @radius_users = []
    User.all.each do |user|
      beta = @client.distance_to(user.address).to_i
      if beta < user.radius
        @radius_users << user
      end
    end

    works_users = []
    @radius_users.each do |radius_user|
      if @client.construction == true && radius_user.construction == true
        works_users << radius_user
      elsif @client.renovation == true && radius_user.renovation == true
        works_users << radius_user
      elsif @client.entretien == true && radius_user.entretien == true
        works_users << radius_user
      end
    end

    skills_users = []
    works_users.each do |works_user|
      if @client.charpente == true && works_user.charpente == true
        skills_users << works_user
      elsif @client.couverture == true && works_user.couverture == true
        skills_users << works_user
      elsif @client.terrasse == true && works_user.terrasse == true
        skills_users << works_user
      elsif @client.plomberie == true && works_user.plomberie == true
        skills_users << works_user
      elsif @client.ouverture == true && works_user.ouverture == true
        skills_users << works_user
      end
    end

    @available_users = []
    skills_users.each do |skills_user|
      if @client.maison == true && skills_user.maison == true
        @available_users << skills_user
      elsif @client.chateau == true && skills_user.chateau == true
        @available_users << skills_user
      elsif @client.immeuble == true && skills_user.immeuble == true
        @available_users << skills_user
      elsif @client.monument_historique == true && skills_user.monument_historique == true
        @available_users << skills_user
      end
    end
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone_number, :email, :address, :construction, :renovation, :entretien, :charpente, :couverture, :ouverture, :terrasse, :plomberie, :maison, :chateau, :immeuble, :monument_historique)
  end

  def set_client
    @client = Client.find(params[:id])
  end

end
