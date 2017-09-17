class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  mount_uploader :imge, ImageUploader
  validates :text, presence: true
end
