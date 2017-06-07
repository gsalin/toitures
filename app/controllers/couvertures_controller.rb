class CouverturesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :new_client

  def index
  end

  def introduction
  end

  def analyse_comparative_materiaux_couverture
  end

  private

  def new_client
    @client = Client.new
  end



end
