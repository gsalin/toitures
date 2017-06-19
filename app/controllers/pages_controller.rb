class PagesController < ApplicationController

skip_before_action :authenticate_user!
skip_before_action :authenticate_worker!

  def home
    @client = Client.new
    @articles = Article.last(4)
    @users = User.last(3)
  end
end
