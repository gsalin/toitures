class GuidesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_worker!
  before_action :new_client

  def index
  end

  private

  def new_client
    @client = Client.new
  end


end
