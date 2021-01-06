class Talk < ApplicationRecord
  validates :content, presence: true, length: { minimum: 3, maximum: 200 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
end
