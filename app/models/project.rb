class Project < ApplicationRecord
  belongs_to :user
  has_attachments :project_photos, maximum: 3

  validates :title, presence: true, length: { maximum: 50, minimum: 20 }
  validates :description, presence: true, uniqueness: true, length: { minimum: 300, maximum: 900 }
  validates :cost, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100000000 }
  validates :address, presence: true
  validates :project_photos, presence: true
  validates :date, presence: true
end
