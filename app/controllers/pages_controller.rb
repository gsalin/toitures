class PagesController < ApplicationController

skip_before_action :authenticate_user!

  def home
    @city = request.location
    @client = Client.new(address: @city)
    @articles = Article.last(2)
    # @users = User.pro.last(3)
  end

  def robots
    respond_to :text
    expires_in 6.hours, public: true
  end

end
