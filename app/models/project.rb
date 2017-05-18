class Project < ApplicationRecord
  belongs_to :user
  has_attachments :project_photos, maximum: 3

  validates :title, presence: true, length: { maximum: 50, minimum: 20 }
  validates :description, presence: true, uniqueness: true, length: { maximum: 900, minimum: 300 }
  validates :cost, presence: true
  validates :address, presence: true
  validates :project_photos, presence: true
end
