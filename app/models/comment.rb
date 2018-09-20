class Comment < ApplicationRecord
  belongs_to :campaign, optional: true
  belongs_to :user
  belongs_to :todo_list, optional: true
end
