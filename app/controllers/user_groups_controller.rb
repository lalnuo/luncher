class UserGroupsController < ApplicationController
  def create
    redirect :root unless session[:user_id]
    g = Group.find_by(:name => params[:name])
    if g && g.authenticate(params[:password])
      UserGroup.create(:group_id => g.id, :user_id => session[:user_id])
      redirect_to g
    else
      flash[:error] = 'Wrong group name or password'
      redirect_to :action => 'new'
    end
  end

  def new

  end
end
