class ToituresController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :new_client

  def index
  end

  def achat_nos_conseils_lors_du_choix_de_votre_toiture
  end

  def les_cles_pour_reussir_la_renovation_de_votre_toit
  end

  private

  def new_client
    @client = Client.new
  end



end
