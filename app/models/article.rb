class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_attachments :photos, maximum: 2, accept: [:jpg, :png, :gif]

  include FriendlyId
  friendly_id :title, :use => :slugged
end
