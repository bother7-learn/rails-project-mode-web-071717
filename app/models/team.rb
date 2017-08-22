class Team < ApplicationRecord
  belongs_to :league, optional: true
  has_many :players
end
