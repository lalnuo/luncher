class UsersController < ApplicationController
  def create
    u = User.create(user_params)

    redirect_to :root
  end

  def new

  end

  def home
    @user = User.find(session[:user_id])
    render 'show'
  end

  def show
    @user = User.find(params[:user_id])
  end

  def login
    user = User.login(params[:user][:username], params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to :action => 'home'
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
