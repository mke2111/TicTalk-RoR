class LikesController < ApplicationController
  def create
    @like = helpers.current_user.likes.new(talk_id: params[:talk_id])

    if @like.save
      redirect_to talks_path, notice: 'You liked a talk.'
    else
      redirect_to talks_path, alert: 'You cannot like this talk.'
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], user: helpers.current_user, talk_id: params[:talk_id])
    if like
      like.destroy
      redirect_to talks_path, notice: 'You disliked a talk.'
    else
      redirect_to talks_path, alert: 'You cannot dislike talk that you did not like before.'
    end
  end
end
