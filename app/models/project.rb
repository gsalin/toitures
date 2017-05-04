class Project < ApplicationRecord
  belongs_to :user
  has_attachments :project_photos, maximum: 3
end
