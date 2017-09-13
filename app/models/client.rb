class Client < ApplicationRecord
  #geocoder for google maps
  geocoded_by :address, :params => {:region => "fr"}

  after_validation :geocode, if: :address_changed?

  # after_create :send_email_to_user

  # private

  # def send_email_to_user
  #   UserMailer.contact_user(self).deliver_now
  # end

end
