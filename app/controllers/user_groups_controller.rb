class UserGroupsController < ApplicationController
  before_action :redirect_to_root_if_not_logged

  def create
    g = Group.find(params[:group_id])
    if g && g.user_has_access?(current_user.id, session[:group_permissions])
      UserGroup.create(:group_id => g.id, :user_id => current_user.id)
    end
    redirect_to :back
  end

  def new

  end

  def destroy
    user_group = UserGroup.find_by(:user_id => current_user.id, :group_id => params[:group_id])
    user_group.destroy
    redirect_to :controller => :users, :action => :show, :user_id => current_user.id
  end
end
