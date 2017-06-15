class Article < ApplicationRecord
  belongs_to :category
  has_attachments :photos, maximum: 2, accept: [:jpg, :png, :gif]
end
