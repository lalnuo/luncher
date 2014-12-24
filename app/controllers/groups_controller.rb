class GroupsController < ApplicationController
  before_action :redirect_to_root_if_not_logged

  def index
    @groups = []
    if params[:city]
      @city = params[:city].capitalize
      @groups = Group.where(:public => true, :city => @city)
    end
  end

  def search_by_city
    if params[:group][:city]
      redirect_to :action => :index, :city => params[:group][:city]
      return
    end
  end

  def search_secret_group
    if params[:group][:name]
      g = Group.find_by_name_and_auth(params[:group][:name], params[:group][:password])
      if g
        session[:group_permissions] << g.id
        redirect_to :action => :show, :id => g.id
        return
      end
    else
      flash[:notice] = 'Incorrect group name or password'
      redirect_to :back
    end
  end

  def show
    group = Group.find(params[:id])
    unless group.user_has_access?(current_user.id, session[:group_permissions] || [])
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
