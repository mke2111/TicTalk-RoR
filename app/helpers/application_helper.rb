module ApplicationHelper
  def current_user_is_author?(opinion)
    opinion.author_id == session[:user_id]
  end

  def photo(email)
    if email.nil? || email.empty?
      'https://source.unsplash.com/random/200x200'
    else
      'default_avatar.jpg'
    end
  end

  def cover_image(link)
    if link.nil? || link.empty?
      'https://source.unsplash.com/random/1000x200'
    else
      link
    end
  end

  def following?(user)
    current_user.following.include?(user)
  end

  def current_user?(user)
    user.id == session[:user_id]
  end

  def like_or_dislike_btn(talk)
    like = Like.find_by(talk: talk, user: current_user)
    if like
      link_to('Dislike', talk_like_path(id: like.id, talk_id: talk.id), method: :delete)
    else
      link_to('Like', talk_likes_path(talk_id: talk.id), method: :post)
    end
  end
end
