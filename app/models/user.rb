class User < ApplicationRecord
  # before_save :default_type
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :type, presence: true
  has_many :todo_lists
end

class Expert < User
  has_many :campaigns
end

class Novice < User
end
