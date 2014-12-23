# TODO: auths group level
class GroupsController < ApplicationController
  before_action :redirect_to_root_if_not_logged

  def index
    @groups = Group.public_groups
  end

  def show
    render :action => 'index' unless UserGroup.find_by(:user_id => session[:user_id], :group_id => params[:id])
    @group = Group.find(params[:id])
    @lunch = Lunch.new(:group_id => @group.id)
  end

  def create
    group = Group.new(group_params)
    group.city = group.city.capitalize
    if group.save
      UserGroup.create(:group_id => group.id, :user_id => session[:user_id])
      redirect_to group
    else
      redirect_to :back # TODO add error message about missing fields
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :password, :city, :public)
  end
end
