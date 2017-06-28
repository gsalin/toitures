class PagesController < ApplicationController

skip_before_action :authenticate_user!
skip_before_action :authenticate_worker!

  def home
    @client = Client.new
    @articles = Article.last(2)
    @users = User.last(3)
  end

  def robots
    respond_to :text
    expires_in 6.hours, public: true
  end

end
