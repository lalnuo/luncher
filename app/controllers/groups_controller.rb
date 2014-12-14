class GroupsController < ApplicationController
  def index
  end

  def show
    render :action => 'index' unless session[:group_id].to_i == params[:id].to_i
    @group = Group.find(params[:id])
    @lunch = Lunch.new(:group_id => @group.id)
  end


  def create
    group =  Group.find_by(:name => params[:group][:name]) || Group.create(group_params)
    session[:group_id] = group.id if group.authenticate(params[:group][:password])
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
