class Player < ApplicationRecord
  belongs_to :team
  delegate :league, to: :team
end
