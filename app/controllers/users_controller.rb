class UsersController < ApplicationController
  before_action :redirect_to_root_if_not_logged, :only => [:home, :show]

  def create
    User.create(user_params)
    redirect_to :root
  end

  def new

  end

  def index

  end

  def show
    @user = User.find(session[:user_id])
    render 'show'
  end

  def login
    user = User.login(params[:user][:username], params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:error] = 'Wrong username or password'
      redirect_to :back
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
