class User < ApplicationRecord
  has_attachment :photo_presentation
  has_attachment  :photo_company_logo
  has_attachments :photos_projet_1, maximum: 3
  has_attachments :photos_projet_2, maximum: 3
  has_attachments :photos_projet_3, maximum: 3
  has_attachments :photos_projet_4, maximum: 3
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #geocoder for google maps
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
