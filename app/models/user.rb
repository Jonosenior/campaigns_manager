class User < ApplicationRecord
  # before_save :default_status
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :type, presence: true
  has_many :todo_lists
  has_many :todos
  enum status: [:qualified, :not_qualified, :banned]
end

class Expert < User
  has_many :campaigns
end

class Novice < User
  before_save :ensure_expert_fields_blank

  private
  def ensure_expert_fields_blank
    self.profession = nil
    self.service = nil
  end
end
