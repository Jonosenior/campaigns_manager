class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :title, :commentable_type, :commentable_id, :user_id, presence: true
end
