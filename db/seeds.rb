# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.destroy_all
Team.destroy_all
League.destroy_all


leagues = [
  {name:"La Liga"}, #1
  {name: "Bundesliga"}, #2
  {name: "Premier League"}, #3
  {name: "French Ligue"}
]
leagues.each {|l| League.create(l)}

teams = [
  {name: "Real Madrid", league_id:1},          #1
  {name: "Barcelona", league_id:1},            #2
  {name: "Arsenal", league_id:3},              #3
  {name: "Dortmund", league_id:2},             #4
  {name: "Manchester United", league_id:3},    #5
  {name: "Liverpool", league_id:3},            #6
  {name: "Atletico Madrid", league_id:1},      #7
  {name: "Bayern Munich", league_id:2},        #8
  {name: "Paris Saint-Germain", league_id: 4} #9
]

teams.each {|t| Team.create(t)}

players = [
  {name:"Sergio Ramos",shooting:75, passing:90, defense:75, foul:7, dribbling:80, team_id:1},
  {name:"Christiano Ronaldo",shooting:97, passing:85, defense:75, foul:5, dribbling:93, team_id:1},
  {name:"Zlatan Ibrahimovic",shooting:96, passing:80, defense:65, foul:13, dribbling:80, team_id:5},
  {name:"Lionel Messi",shooting:75, passing:90, defense:75, foul:5, dribbling:80, team_id:2},
  {name:"Pulisic",shooting:75, passing:90, defense:75, foul:7, dribbling:80, team_id:4},
  {name:"Coutinho",shooting:75, passing:90, defense:75, foul:7, dribbling:80, team_id:6},
  {name:"Lewandowski",shooting:75, passing:90, defense:75, foul:8, dribbling:80, team_id:8},
  {name:"Arturo Vidal",shooting:75, passing:90, defense:75, foul:8, dribbling:80, team_id:8},
  {name:"Marco Asensio",shooting:75, passing:90, defense:75, foul:4, dribbling:80, team_id:1},
  {name:"Alexis Sanchez",shooting:75, passing:90, defense:75, foul:4, dribbling:80, team_id:3},
  {name:"Luis Suarez",shooting:75, passing:90, defense:75, foul:8, dribbling:80, team_id:2},
  {name:"Paul Pogba",shooting:75, passing:90, defense:75, foul:9, dribbling:80, team_id:3},
  {name:"Antoine Griezmann",shooting:75, passing:90, defense:70, foul:65, dribbling:80, team_id:7},
  {name:"Fernando Torres",shooting:75, passing:90, defense:70, foul:65, dribbling:80, team_id:7},
  {name: "Neymar", shooting:95, passing:92, defense: 60, foul: 20, }
]

players.each {|p| Player.create(p)}
