require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) {create(:group)}
  let(:message) {create(:message)}

describe 'GET #index' do
  context "user_signed_in" do

      before do
        login_user user
        get :index, params:{ group_id: group }
      end

# ログインしている時
    # 定義しているインスタンス変数があるか
    it "assigns the requested message to @message" do
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "assigns the requested group to @group" do
      expect(assigns(:group)).to eq group
    end

    # 該当するビューが表示されているか
    it "render the :index template" do
      expect(response).to render_template :index
    end
  end

# ログインしていない場合
  context "user_not_signed_in" do
    # 意図したビューにリダイレクトされているか
    it "redirect_to new_user_session_path" do
      get :index, params: {group_id: group.id}
      expect(response).to redirect_to new_user_session_path
    end
  end
end

describe 'POST #create' do
# ログインしていて保存に成功した時
 context "user_signed_in and success save image" do
     before do
        login_user user
      end

    #メッセージが保存できたか
    it "save message " do
      expect{ post :create, params: { group_id: group, message: attributes_for(:message) } }.to change(Message, :count).by(1)
    end

    it "render the :index template" do
      get :index, params: { group_id: group}
      expect(response).to render_template :index
    end
  end

  context "user_signed_in and fail save message" do
    before do
      login_user user
    end

    it "is not save message" do
      expect{ post :create, params: { group_id: group, message: attributes_for(:message, text: nil, image: nil) } }.to change(Message, :count).by(0)
    end

    it "render the :index template" do
      get :index, params: { group_id: group}
      expect(response).to render_template :index
    end
  end

  context "user_not_signed_in" do

    it "redirect_to new_user_session_path" do
      get :index, params: {group_id: group.id}
      expect(response).to redirect_to new_user_session_path
    end
  end
end
end
