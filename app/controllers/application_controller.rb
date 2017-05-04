class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :company, :position, :office_phone, :mobile_phone, :address, :description, :radius, :photo_company_logo, :photo_presentation, photos_projet_1: [], photos_projet_2: [], photos_projet_3: [], photos_projet_4: []])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :company, :position, :office_phone, :mobile_phone, :address, :description, :radius, :photo_company_logo, :photo_presentation, photos_projet_1: [], photos_projet_2: [], photos_projet_3: [], photos_projet_4: []])
  end
end
