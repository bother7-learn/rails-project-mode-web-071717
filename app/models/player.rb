class Player < ApplicationRecord
  belongs_to :team
  delegate :league, to: :team

  validates :name,:shooting,:passing,:defense,:foul,:dribbling, presence: true
   
end
