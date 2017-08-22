class Player < ApplicationRecord
  belongs_to :team
  belongs_to :user_team
  delegate :league, to: :team

  validates :name,:shooting,:passing,:defense,:foul,:dribbling, presence: true

end
