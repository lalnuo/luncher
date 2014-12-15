# TODO: auths group level and user level
class GroupsController < ApplicationController
  def index
  end

  def show
    render :action => 'index' unless UserGroup.find_by(:user_id => session[:user_id], :group_id => params[:id])
    @group = Group.find(params[:id])
    @lunch = Lunch.new(:group_id => @group.id)
  end


  # TODO auth
  def create
    group =  Group.find_by(:name => params[:group][:name]) || Group.create(group_params)
    UserGroup.create(:group_id => group.id, :user_id => session[:user_id])
    redirect_to group
  end

  def logout
    session[:group_id] = nil
    redirect_to :root
  end

  private

  def group_params
    params.require(:group).permit(:name, :password)
  end
end
