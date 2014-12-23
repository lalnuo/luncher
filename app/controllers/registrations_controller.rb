class RegistrationsController < ApplicationController
  def create
    Registration.create(:user_id => session[:user_id], :lunch_id => params[:lunch_id])
    redirect_to :back
  end

  def destroy
    registration = Registration.find(params[:registration_id])
    if registration && registration.user_id == current_user.id
      registration.delete
    end
    redirect_to :back
  end
end
