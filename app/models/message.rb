class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  mount_uploader :imge, ImageUploader
  validates :text, presence: true, unless: :image

  private
    def image
      image = presence
    end
end
