class PagesController < ApplicationController

skip_before_action :authenticate_user!, only: :home
skip_before_action :authenticate_worker!, only: :home

  def home
    @client = Client.new
  end
end
