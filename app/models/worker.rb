class Worker < ApplicationRecord

  has_attachment :cv
  has_attachment :photo

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  # validates :phone_number, presence: true, format: { with: ((?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}) }

  include FriendlyId
  friendly_id :last_name, :use => :slugged

end
