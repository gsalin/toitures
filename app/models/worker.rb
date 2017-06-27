class Worker < ApplicationRecord

  has_attachment :cv
  has_attachment :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  # validates :phone_number, presence: true, format: { with: ((?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}) }

  include FriendlyId
  friendly_id :last_name, :use => :slugged

end
