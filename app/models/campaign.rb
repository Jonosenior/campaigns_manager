class Campaign < ApplicationRecord
  belongs_to :expert
  has_many :todo_lists, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :todo_lists, allow_destroy: true

  validates :title, presence: true
end
