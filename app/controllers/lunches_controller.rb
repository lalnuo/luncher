class LunchesController < ApplicationController

  def create
    lunch = Lunch.new(post_params)
    if !lunch.save
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
