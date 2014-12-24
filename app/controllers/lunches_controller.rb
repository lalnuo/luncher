class LunchesController < ApplicationController
  before_action :redirect_to_root_if_not_logged

  def create
    lunch = Lunch.new(post_params)
    if lunch.save
      Registration.create(:user_id => current_user.id, :lunch_id => lunch.id)
    else
      flash[:notice] = 'Looks like a bad lunch!'
    end
    redirect_to :back
  end

  def show
    @lunch = Lunch.find(params[:id])
  end

  def post_params
    params.require(:lunch).permit(:name, :time, :info, :group_id)
  end
end
