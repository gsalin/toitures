class User < ApplicationRecord

  after_create :send_welcome_email

  enum status: [:pro, :worker]
  enum state: [:pending, :accepted, :declined]
  has_attachment :photo_presentation, accept: [:jpg, :jpeg, :png]
  has_attachment :photo_company_logo, accept: [:jpg, :jpeg, :png, :svg]
  has_attachment :photo, accept: [:jpg, :jpeg, :png]
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

  # ATTENTION AUX VALIDATES DANS LE MODEL, ne pas faire les suivants ici minimum si dans les forms!!!!

  # validates :company, uniqueness: true
  # validates :office_phone, uniqueness: true, format: {with: /((\+|00)33|0)[1-9](\D?\d\d){4}/}
  # validates :mobile_phone, uniqueness: true, format: {with: /((\+|00)33|0)[1-9](\D?\d\d){4}/}
  # validates :description, length: { minimum: 300, maximum: 900 }
  validates :radius, numericality: { only_integer: true, greater_than_or_equal_to: 50 }

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
