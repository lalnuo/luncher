class GroupsController < ApplicationController
  before_action :redirect_to_root_if_not_logged

  def index
    @groups = []
    if params[:city]
      @city = params[:city].capitalize
      @groups = Group.where(:public => true, :city => @city)
    end
  end

  def search
    redirect_to :action => :index, :city => params[:group][:city]
  end

  def show
    group = Group.find(params[:id])
    unless group.user_has_access?(current_user.id)
      render :action => 'index'
    end

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
