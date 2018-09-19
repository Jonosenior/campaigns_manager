class Campaign < ApplicationRecord
  belongs_to :expert
  has_many :todo_lists
end
