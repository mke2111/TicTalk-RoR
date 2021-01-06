class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 12 }, uniqueness: true
  validates :fullName, presence: true, length: { maximum: 15 }

  has_many :talks, foreign_key: 'author_id', dependent: :destroy

  has_many :follower_relationships, foreign_key: 'followed_id', class_name: 'Following', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Following', dependent: :destroy
  has_many :following, through: :following_relationships, source: :followed

  has_many :likes
end
