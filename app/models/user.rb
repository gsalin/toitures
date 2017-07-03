class User < ApplicationRecord

  enum status: [:pro, :worker]
  has_attachment :photo_presentation
  has_attachment :photo_company_logo
  has_attachment :photo
  has_attachment :cv, accept: [:pdf]

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
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :status, presence: true

  validates :company, uniqueness: true
  validates :office_phone, uniqueness: true
  validates :mobile_phone, uniqueness: true
  validates :description,length: { minimum: 300, maximum: 900 }
  validates :radius, numericality: { only_integer: true, greater_than_or_equal_to: 50 }
end
