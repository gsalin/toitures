class User < ApplicationRecord

  enum status: [:pro, :worker, :institution]
  enum state: [:pending, :accepted, :declined]
  has_attachment :photo_presentation, accept: [:jpg, :jpeg, :png]
  has_attachment :photo_company_logo, accept: [:jpg, :jpeg, :png, :svg]
  has_attachment :photo, accept: [:jpg, :jpeg, :png]
  has_attachment :cv, accept: [:pdf]

  has_many :projects, dependent: :destroy
  has_many :articles

  include FriendlyId
  friendly_id :company, :use => :slugged

  def should_generate_new_friendly_id?
    company_changed?
  end


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


  #METTRE DES VALIDATES ICI UNIQUEMENT SI DONNEE UNIVERSELLE

  validates :mobile_phone, format: {with: /\A((\+|00)33|0)[1-9](\D?\d\d){4}\z/}, on: :update
  validates :office_phone, format: {with: /\A((\+|00)33|0)[1-9](\D?\d\d){4}\z/}, presence: true, on: :update, if: :pro_or_institution?
  validates :description, length: { minimum: 200, maximum: 600 }, on: :update, presence: true, if: :pro_or_institution?
  validates :company, presence: true, on: :update, if: :pro_or_institution?
  validates :address, presence: true, on: :update
  validates :city, presence: true, on: :update, if: :pro_or_institution?
  validates :zip_code, presence: true, on: :update, if: :pro_or_institution?
  validates :photo_presentation, presence: true, on: :update, if: :pro_or_institution?
  validates :photo_company_logo, presence: true, on: :update, if: :pro_or_institution?
  validates :cv, presence: true, on: :update, if: :worker?
  validates :photo, presence: true, on: :update, if: :worker?
  validates :radius, numericality: { only_integer: true, greater_than_or_equal_to: 50 }, on: :update, presence: true, if: :pro?

  validate :has_at_least_one_speciality, on: :update, if: :pro?
  validate :has_at_least_one_place, on: :update, if: :pro?
  validate :has_at_least_one_job, on: :update, if: :worker?
  validate :link_title_1_verif, on: :update, if: :pro_or_institution?
  validate :link_title_2_verif, on: :update, if: :pro_or_institution?
  validate :link_title_3_verif, on: :update, if: :pro_or_institution?

  after_create :send_welcome_email

  private

  def send_welcome_email
    if self.pro?
      UserMailer.welcome(self).deliver_now
    elsif self.worker?
      UserMailer.welcome_worker(self).deliver_now
    end
  end

  def has_at_least_one_speciality
    if plomberie == false && couverture == false && charpente == false && ouverture == false && terrasse == false
      errors.add(:plomberie, :blank)
    end
  end

  def has_at_least_one_place
    if maison == false && chateau == false && immeuble == false && locaux_industriels == false
      errors.add(:maison, :blank)
    end
  end

  def has_at_least_one_job
    if couvreur == false && charpentier == false
      errors.add(:couvreur, :blank)
    end
  end

  def pro_or_institution?
    pro? || institution?
  end

  def link_title_1_verif
    if press_link_1.present? == true && press_link_title_1.present? == false
      errors.add(:press_link_title_1, :blank)
    end
  end

  def link_title_2_verif
    if press_link_2.present? == true && press_link_title_2.present? == false
      errors.add(:press_link_title_2, :blank)
    end
  end

  def link_title_3_verif
    if press_link_3.present? == true && press_link_title_3.present? == false
      errors.add(:press_link_title_3, :blank)
    end
  end

end
