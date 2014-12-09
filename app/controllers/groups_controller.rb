class GroupsController < ApplicationController
  def index

  end

  def show
    @group = Group.find(params[:id])
    @lunch = Lunch.new(:group_id => @group.id)
  end


  def create
    group =  Group.find_by(:name => params[:group][:name])
    group = Group.create(:name => params[:group][:name], :password => "wat") unless group
    redirect_to group
  end

  def destroy

  end
end
