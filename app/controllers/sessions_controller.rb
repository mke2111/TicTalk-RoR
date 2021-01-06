class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = authenticate(session_params)

    respond_to do |format|
      if @user
        session[:username] = @user.username
        session[:user_id] = @user.id
        format.html { redirect_to talks_path, notice: 'Log in successful' }
      else
        format.html { redirect_to new_session_path, notice: 'User not found!' }
      end
    end
  end

  def destroy
    session[:username] = nil
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to new_session_path, notice: 'Log out successful' }
    end
  end

  private

  def authenticate(username)
    User.find_by(username)
  end

  def session_params
    params.require(:session).permit(:username)
  end
end
