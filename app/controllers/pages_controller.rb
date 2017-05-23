# class PagesController < ApplicationController
#   include HighVoltage::StaticPage
# skip_before_action :authenticate_user!, only: [:home, :contact]

#   def home
#     @client = Client.new
#   end

# end

class PagesController < ApplicationController
  include HighVoltage::StaticPage

  skip_before_action :authenticate_user!
  layout :layout_for_page

  def home
    @client = Client.new
  end

  private

  def layout_for_page
    case params[:id]
    when 'home'
      'home'
    else
      'application'
    end
  end
end
