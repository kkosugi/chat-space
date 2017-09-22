require 'rails_helper'

describe Message do
  describe '#create' do

    it 'is valid  a text' do
      group = create(:group)
      user = create(:user)
      message = build(:message, image: nil, group_id: group.id, user_id: user.id)
      expect(message).to be_valid
    end

    it 'is valid with a image' do
      group = create(:group)
      user = create(:user)
      message = build(:message, group_id: group.id, user_id: user.id)
      expect(message).to be_valid
    end

    it 'is valid with a text and image' do
      group = create(:group)
      user = create(:user)
      message = build(:message, group_id: group.id, user_id: user.id)
      expect(message).to be_valid
    end

    it 'is invalid without a text and image' do
      message = build(:message, text: nil, image: nil)
      expect(message).to_not be_valid
    end

    it 'is invalid without group_id' do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group]).to include("を入力してください")
    end

    it 'is invalid without user_id' do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user]).to include("を入力してください")
    end

  end
end


