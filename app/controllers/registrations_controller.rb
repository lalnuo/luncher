class RegistrationsController < ApplicationController
  def create
    Registration.create(:name => params[:registration][:name], :lunch_id => params[:lunch_id])
    redirect_to :back
  end
end
