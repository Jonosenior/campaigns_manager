class Comment < ApplicationRecord
  belongs_to :campaign, optional: true
  belongs_to :user
  belongs_to :todo_list, optional: true

  validates :title, presence: true
  validates :campaign_xor_todo_list

  private

  def campaign_xor_todo_list
    # binding.pry
    if campaign && todo_list || !campaign && !todo_list
      errors.add(:parent, "must have one parent")
    end
  end
end
