class League < ApplicationRecord
  has_many :teams
  has_many :players, through: :teams
end
