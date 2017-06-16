class EnergiesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_worker!
  before_action :new_client

  def index
  end

  def photovoltaique_2017
  end

  private

  def new_client
    @client = Client.new
  end



end
