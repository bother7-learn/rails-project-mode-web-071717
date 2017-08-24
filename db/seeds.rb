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
  {name: "French Ligue"} #4
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
  {name: "Paris Saint-Germain", league_id: 4}  #9
]

teams.each {|t| Team.create(t)}

userteams = [{name: "Real Madrid"},
{name: "Barcelona"},{name: "Liverpool"} ]

userteams.each {|t| UserTeam.create(t)}
# {name:,shooting:, passing:, defense:, foul:, dribbling:, team_id:, position:},
players = [
  {name:"Sergio Ramos",shooting:60, passing:80, defense:85, foul:7, dribbling:80,contract:13, team_id:1, user_team_ids: [1], position: "defender"},
  {name:"Christiano Ronaldo",shooting:97, passing:85, defense:55, foul:5, dribbling:93,contract:20, team_id:1, user_team_ids: [1], position: "forward"},
  {name:"Zlatan Ibrahimovic",shooting:96, passing:80, defense:65, foul:13, dribbling:80,contract:17, team_id:5, position: "forward"},
  {name:"Lionel Messi",shooting:95, passing:94, defense:35, foul:5, dribbling:80, team_id:2,contract:20, user_team_ids: [2], position: "forward"},
  {name:"Christian Pulisic",shooting:75, passing:80, defense:55, foul:7, dribbling:80, team_id:4,contract:15, position: "forward"},
  {name:"Coutinho",shooting:86, passing:92, defense:42, foul:7, dribbling:93, team_id:6,contract:15, position: "forward"},
  {name:"Lewandowski",shooting:90, passing:78, defense:35, foul:8, dribbling:80, team_id:8,contract:16, position: "forward"},
  {name:"Arturo Vidal",shooting:70, passing:80, defense:70, foul:8, dribbling:80, team_id:8, contract:8, position: "midfielder"},
  {name:"Marco Asensio",shooting:85, passing:80, defense:65, foul:4, dribbling:85, team_id:1,contract:15, user_team_ids: [1], position: "midfielder"},
  {name:"Alexis Sanchez",shooting:85, passing:90, defense:55, foul:4, dribbling:80, team_id:3,contract:15, position: "forward"},
  {name:"Luis Suarez",shooting:92, passing:90, defense:35, foul:8, dribbling:80, team_id:2,  user_team_ids: [2], contract:18, position: "forward"},
  {name:"Paul Pogba",shooting:75, passing:90, defense:75, foul:9, dribbling:80, team_id:3,contract:17, position: "midfielder"},
  {name:"Antoine Griezmann",shooting:80, passing:90, defense:40, foul:15, dribbling:80,contract:18, team_id:7, position: "forward"},
  {name:"Fernando Torres",shooting:75, passing:90, defense:25, foul:15, dribbling:80,contract:11, team_id:7, position: "forward"},
  {name: "Neymar", shooting:95, passing:92, defense: 60, foul: 20, dribbling: 90,contract:20, team_id: 9, position: "forward"},
  {name: "Marc ter Stergen", shooting:20, passing:80, defense: 95, foul: 30, dribbling: 40, team_id: 2,contract:13, user_team_ids: [2], position: "goalie"},
  {name: "Nelson Semedo", shooting:30, passing:80, defense:85, foul:30, dribbling:78, team_id:2,contract:11, user_team_ids: [2], position: "defender"},
  {name: "Javier Mascherano", shooting:70, passing:80, defense:88, foul:40, dribbling:80, team_id:2,contract:12, user_team_ids: [2], position: "defender"},
  {name: "Samuel Umtiti", shooting:30, passing:80, defense:85, foul:30, dribbling:80, team_id:2,contract:8, user_team_ids: [2], position: "defender"},
  {name: "David Alba", shooting:50, passing:75, defense:80, foul:40, dribbling:75, team_id:2,contract:5, user_team_ids: [2], position: "defender"},
  {name: "Ivan Rakitic", shooting:68, passing:90, defense:60, foul:40, dribbling:70, team_id:2,contract:4, user_team_ids: [2], position: "midfielder"},
  {name: "Sergio Busquets", shooting: 60, passing:85, defense:90, foul:50, dribbling:80, team_id:2,contract:4, user_team_ids: [2], position: "midfielder"},
  {name: "Sergi Roberto", shooting:70, passing:88, defense:75, foul:30, dribbling:80, team_id:2, contract:4, user_team_ids: [2], position: "midfielder"},
  {name: "Gerard Deulofeu", shooting:88, passing:75, defense:30, foul:15, dribbling:72, team_id:2, contract:4, user_team_ids: [2], position: "forward"},
  {name: "Keylor Navas", shooting:20, passing:60, defense:88, foul:34, dribbling:30, team_id:1, contract:4, user_team_ids: [1], position:"goalie"},
  {name: "Marcelo",shooting:60, passing:73, defense:85, foul:30, dribbling:60, team_id:6, contract:4, user_team_ids: [1], position:"defender"},
  {name: "Isco",shooting:70, passing:90, defense:48, foul:32, dribbling:85, team_id:6, contract:4, user_team_ids: [1], position:"midfielder"},
  {name: "Nacho",shooting:40, passing:72, defense:92, foul:40, dribbling:64, team_id:6, contract:4, user_team_ids: [1], position: "defender"},
  {name: "Toni Kroos",shooting:30, passing:80, defense:75, foul:38, dribbling:75, team_id:6, contract:4, user_team_ids: [1], position: "midfielder"},
  {name: "Dani Carvajal",shooting:40, passing:75, defense:89, foul:34, dribbling:60, team_id:6, contract:4, user_team_ids: [1], position:"defender"},
  {name: "Casemiro",shooting: 70, passing:75 , defense:85, foul:40, dribbling:60, team_id:6, contract:4, user_team_ids: [1], position:"midfielder"},
  {name: "Gareth Bale",shooting:92, passing:84, defense:50, foul:25, dribbling:87, team_id:6, contract:4, user_team_ids: [1], position:"forward"},
  {name: "Sadio Mane",shooting:93, passing:92, defense:48, foul:10, dribbling:96, team_id:6, contract:4, user_team_ids: [3], position:"forward"},
  {name: "Adam Lallana",shooting:89, passing:92, defense:73, foul:15, dribbling:95, team_id:6, contract:4, user_team_ids: [3], position:"midfielder"},
  {name: "Daniel Sturridge",shooting:86, passing:74, defense:35, foul:15, dribbling:85, team_id:6, contract:4, user_team_ids: [3], position:"forward"},
  {name: "James Milner",shooting:82, passing:89, defense:80, foul:15, dribbling:85, team_id:6, contract:4, user_team_ids: [3], position:"defender"},
  {name: "Loris Karius",shooting:30, passing:84, defense:80, foul:1, dribbling:55, team_id:6, contract:4, user_team_ids: [3], position:"goalie"},
  {name: "Emre Can",shooting:83, passing:88, defense:88, foul:15, dribbling:87, team_id:6, contract:4, user_team_ids: [3], position:"midfielder"},
  {name: "Roberto Firmino",shooting:85, passing:87, defense:52, foul:15, dribbling:90, team_id:6, contract:4, user_team_ids: [3], position:"forward"},
  {name: "Ragnar Klavan",shooting:48, passing:63, defense:79, foul:15, dribbling:62, team_id:6, contract:4, user_team_ids: [3], position:"defender"},
  {name: "Mamadou Sakho",shooting:33, passing:62, defense:50, foul:25, dribbling:56, team_id:6, contract:4, user_team_ids: [3], position:"defender"},
  {name: "Jordan Henderson",shooting:33, passing:62, defense:50, foul:15, dribbling:56, team_id:6, contract:4, user_team_ids: [3], position:"midfielder"},
  {name: "Lucas Leiva",shooting:39, passing:70, defense:80, foul:25, dribbling:71, team_id:6, contract:4, user_team_ids: [3], position:"midfielder"},
]

players.each {|p| Player.create(p)}
