class PagesController < ApplicationController

skip_before_action :authenticate_user!
skip_before_action :authenticate_worker!

  def home
    @client = Client.new
  end
end
