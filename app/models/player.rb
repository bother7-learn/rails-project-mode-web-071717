class Player < ApplicationRecord
  belongs_to :team, optional: true
  belongs_to :user_team, optional: true
  delegate :league, to: :team

  validates :name, presence: true
  validates :shooting,:passing,:defense,:foul,:dribbling, presence: true
end
