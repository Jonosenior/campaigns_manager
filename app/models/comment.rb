class Comment < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  belongs_to :todo_list
end
