class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "グループを作成しました"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @group = Group.new
  end

  def updates
  end

  private
    def group_params
      params.require(:group).permit(:name, user_ids: [])
    end
end
