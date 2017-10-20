class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :status, :company])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :company, :position, :office_phone, :mobile_phone, :address, :description, :radius, :photo_company_logo, :photo_presentation, :construction, :renovation, :entretien, :charpente, :couverture, :ouverture, :terrasse, :plomberie, :maison, :chateau, :immeuble, :zip_code, :city, :mh, :rge, :qualibat])
  end
end
