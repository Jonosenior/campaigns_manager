class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :todo_lists
  has_many :todos
  has_many :comments
  enum status: [:qualified, :not_qualified, :banned]
  validates :username, :email, :type, presence: true
  validates :status, presence: true, inclusion: { in: User.statuses }
end

class Expert < User
  has_many :campaigns, dependent: :destroy
  validates :profession, :service, presence: true
end

class Novice < User
  before_save :ensure_expert_fields_nil

  private

  def ensure_expert_fields_nil
    self.profession = nil
    self.service = nil
  end
end
