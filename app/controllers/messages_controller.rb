class MessagesController < ApplicationController

  def index
    @message = Message.new
    @group = Group.find(params[:group_id])
  end

  def create
    @message = Message.new(message_params)
    @group = Group.find(params[:group_id])
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージを投稿しました" }
        format.json
      end
    else
      flash[:alert] = "失敗しました"
      render :index
    end
  end

  private
    def message_params
      params.require(:message).permit(:text, :image).merge(user_id: current_user.id, group_id:params[:group_id])
    end
end
