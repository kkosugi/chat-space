class Group < ApplicationRecord
    has_many :users, through: :group_users
    has_many :group_users
    has_many :messages
    # accepts_nested_attributes_for :group_users

    validates :name, presence: true
      def permit
     if messages.last.try(:text).present?
       messages.last.text
     elsif messages.last.try(:image).present?
       "画像が投稿されました"
     else
       "メッセージがありません"
     end
    end
end
