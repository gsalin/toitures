class Client < ApplicationRecord
  #geocoder for google maps
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
