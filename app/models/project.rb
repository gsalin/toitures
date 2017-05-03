class Project < ApplicationRecord
  belongs_to :user
  has_attachments :photos_projet_1, maximum: 3
  has_attachments :photos_projet_2, maximum: 3
  has_attachments :photos_projet_3, maximum: 3
  has_attachments :photos_projet_4, maximum: 3
end
