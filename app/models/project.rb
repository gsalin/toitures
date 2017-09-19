class Project < ApplicationRecord
  belongs_to :user
  has_attachments :project_photos, maximum: 3

  validates :title, presence: true, length: { maximum: 50, minimum: 15 }
  validates :description, presence: true, uniqueness: true, length: { minimum: 100, maximum: 500 }
  validates :address, presence: true
  validates :project_photos, presence: true
  validates :date, presence: true

  include FriendlyId
  friendly_id :title, :use => :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

end
