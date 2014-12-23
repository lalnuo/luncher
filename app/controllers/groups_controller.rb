# TODO: auths group level
class GroupsController < ApplicationController
  before_action :redirect_to_root_if_not_logged

  def index
  end

  def show
    render :action => 'index' unless UserGroup.find_by(:user_id => session[:user_id], :group_id => params[:id])
    @group = Group.find(params[:id])
    @lunch = Lunch.new(:group_id => @group.id)
  end

  def create
    group =  Group.find_by(:name => params[:group][:name]) || Group.create(group_params)
    UserGroup.create(:group_id => group.id, :user_id => session[:user_id])
    redirect_to group
  end

  private

  def group_params
    params.require(:group).permit(:name, :password)
  end
end
