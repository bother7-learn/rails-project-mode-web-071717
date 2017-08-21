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
  {name: "Premier League"} #3
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
  {name: "Bayern Munich", league_id:2}        #8
]

teams.each {|t| Team.create(t)}

players = [
  {name:"Sergio Ramos", team_id:1},
  {name:"Christiano Ronaldo", team_id:1},
  {name:"Zlatan Ibrahimovic", team_id:5},
  {name:"Lionel Messi", team_id:2},
  {name:"Pulisic", team_id:4},
  {name:"Coutinho", team_id:6},
  {name:"Lewandowski", team_id:8},
  {name:"Arturo Vidal", team_id:8},
  {name:"Marco Asensio", team_id:1},
  {name:"Alexis Sanchez", team_id:3},
  {name:"Luis Suarez", team_id:2},
  {name:"Paul Pogba", team_id:3},
  {name:"Antoine Griezmann", team_id:7},
  {name:"Fernando Torres", team_id:7}
]

players.each {|p| Player.create(p)}
