class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :require_login, only: %i[new create]

  def index
    @users = User.all
  end

  def show
    @talk = Talk.new
    @talks = @user.talks.order('created_at DESC')
    @users = @user.followers
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:username] = @user.username
      session[:user_id] = @user.id
      flash[:notice] = 'User created.'
      redirect_to talks_path
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :coverimage)
  end
end
