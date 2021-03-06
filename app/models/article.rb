class Article < ApplicationRecord
  belongs_to :user

  enum category: [:energie, :environnement, :technique, :style, :patrimoine]
  has_attachment :photo_presentation, accept: [:jpg, :png, :gif]
  has_attachment :second_photo, accept: [:jpg, :png, :gif]

  validates :photo_presentation, presence: true
  validates :title, presence: true,  length: { minimum: 20, maximum:60 }
  validates :body, presence: true, length: { minimum: 2000, maximum: 6000 }
  validates :card_summary, presence: true, length: { minimum: 150, maximum: 200}
  validates :summary, presence: true, length: { minimum: 150, maximum: 500}
  validates :category, presence: true

  include FriendlyId
  friendly_id :title, :use => :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

end
