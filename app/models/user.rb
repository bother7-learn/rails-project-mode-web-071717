class User < ApplicationRecord
  has_secure_password
  has_many :user_teams
  has_many :players

  validates :name,:password, presence: true

end
