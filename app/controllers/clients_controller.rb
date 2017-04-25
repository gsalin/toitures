class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :edit, :update]

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.save

    redirect_to client_path(@client)
  end

  def show
    @client = Client.find(params[:id])
    @available_users = []
    User.all.each do |user|
      beta = @client.distance_to(user.address).to_i
      if beta < user.radius
        @available_users << user
      end
    end
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone_number, :email, :address)
  end

  def set_client
    @client = Client.find(params[:id])
  end

end
