class TodoList < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  has_many :todos
  has_many :comments, dependent: :destroy
end
