class Article < ApplicationRecord
  belongs_to :category
  has_attachments :photos, maximum: 2
end
