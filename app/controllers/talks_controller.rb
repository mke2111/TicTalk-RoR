class TalksController < ApplicationController
  before_action :set_talk, only: %i[show edit update destroy]

  def index
    @talk = Talk.new
    @talks = Talk.all.includes(:author).order('created_at DESC')
    @users = User.all - helpers.current_user.following - [helpers.current_user]
  end

  def create
    @talk = Talk.new(author_id: session[:user_id], content: talk_params[:content])

    respond_to do |format|
      if @talk.save
        format.html { redirect_to talks_path, notice: 'talk was successfully created.' }
        format.json { render :show, status: :created, location: @talk }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @talk.destroy
    respond_to do |format|
      format.html { redirect_to talks_url, notice: 'talk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_talk
    @talk = Talk.find(params[:id])
  end

  def talk_params
    params.require(:talk).permit(:content)
  end
end
