class JobAd < ApplicationRecord
  belongs_to :user
  has_attachment :profile_photo, accept: [:jpg, :jpeg, :png]
  has_attachment :cv, accept: [:pdf]
end
