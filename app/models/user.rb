class User < ApplicationRecord


  has_attachment :photo_presentation
  has_attachment :photo_company_logo

  has_many :projects, dependent: :destroy
  has_many :articles

  include FriendlyId
  friendly_id :company, :use => :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #geocoder for google maps
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :email, uniqueness: true, presence: true
  validates :company, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :office_phone, uniqueness: true
  validates :mobile_phone, presence: true, uniqueness: true
  validates :address, presence: true
  validates :description, presence: true, length: { minimum: 300, maximum: 900 }
  validates :radius, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 50 }
  validates :city, presence: true
  validates :zip_code, presence: true
end
