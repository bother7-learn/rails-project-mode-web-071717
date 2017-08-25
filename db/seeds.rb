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
  {name: "Real Madrid", league_id:1},          #1 >
  {name: "Barcelona", league_id:1},            #2 >
  {name: "Arsenal", league_id:3},              #3 >
  {name: "Dortmund", league_id:2},             #4 >
  {name: "Manchester United", league_id:3},    #5 >
  {name: "Liverpool", league_id:3},            #6 >
  {name: "Atletico Madrid", league_id:1},      #7
  {name: "Bayern Munich", league_id:2},        #8 >
  {name: "Paris Saint-Germain", league_id: 4}  #9 >
]

teams.each {|t| Team.create(t)}

userteams = [{name: "Real Madrid"},
{name: "Barcelona"},{name: "Liverpool"},{name:"Arsenal"},{name: "Dortmund"},{name: "Manchester United"},{name: "Bayern Munich"},{name: "Paris Saint-Germain"},{name: "Atletico Madrid"} ]

userteams.each {|t| UserTeam.create(t)}
# {name:,shooting:, passing:, defense:, foul:, dribbling:, team_id:, position:},
players = [
  {name:"Sergio Ramos",shooting:70, passing:75, defense:91, foul:7, dribbling:75, team_id:1, user_team_ids: [1], position: "defender"},
  {name:"Christiano Ronaldo",shooting:97, passing:88, defense:45, foul:15, dribbling:95, team_id:1, user_team_ids: [1], position: "forward"},
  {name:"Zlatan Ibrahimovic",shooting:92, passing:84, defense:35, foul:25, dribbling:88, team_id:5, user_team_ids:[6], position: "forward"},
  {name:"Lionel Messi",shooting:93, passing:89, defense:35, foul:15, dribbling:97, team_id:2, user_team_ids:[2], position: "forward"},
  {name:"Christian Pulisic",shooting:77, passing:82, defense:40, foul:25, dribbling:84, team_id:4, user_team_ids: [5], position: "midfielder"},
  {name:"Coutinho",shooting:874, passing:82, defense:33, foul:15, dribbling:87, team_id:6, user_team_ids:[3], position: "forward"},
  {name:"Lewandowski",shooting:90, passing:78, defense:35, foul:8, dribbling:80, team_id:8,user_team_ids: [7], position: "forward"},
  {name:"Arturo Vidal",shooting:81, passing:80, defense:84, foul:8, dribbling:79, team_id:8,user_team_ids: [7],  position: "midfielder"},
  {name:"Marco Asensio",shooting:85, passing:83, defense:41, foul:4, dribbling:85, team_id:1, user_team_ids: [1], position: "midfielder"},
  {name:"Alexis Sanchez",shooting:84, passing:79, defense:40, foul:4, dribbling:88, team_id:3,user_team_ids: [4], position: "forward"},
  {name:"Luis Suarez",shooting:93, passing:85, defense:48, foul:8, dribbling:91, team_id:2, user_team_ids: [2],  user_team_ids: [2],  position: "forward"},
  {name:"Paul Pogba",shooting:82, passing:86, defense:75, foul:25, dribbling:88, team_id:5,user_team_ids: [5], position: "midfielder"},
  {name:"Antoine Griezmann",shooting:90, passing:85, defense:40, foul:15, dribbling:90, team_id:7,user_team_ids: [9], position: "forward"},
  {name:"Fernando Torres",shooting:75, passing:90, defense:25, foul:15, dribbling:80, team_id:7,user_team_ids: [9], position: "forward"},
  {name: "Neymar", shooting:95, passing:93, defense: 41, foul: 20, dribbling: 98, team_id: 9,user_team_ids: [8], position: "forward"},
  {name: "Marc ter Stergen", shooting:20, passing:80, defense: 95, foul:5, dribbling: 40, team_id: 2, user_team_ids: [2], position: "goalie"},
  {name: "Nelson Semedo", shooting:53, passing:64, defense:71, foul:25, dribbling:77, team_id:2, user_team_ids: [2], position: "defender"},
  {name: "Javier Mascherano", shooting:53, passing:71, defense:83, foul:25, dribbling:68, team_id:2, user_team_ids: [2], position: "defender"},
  {name: "Samuel Umtiti", shooting:64, passing:70, defense:82, foul:25, dribbling:70, team_id:2, user_team_ids: [2], position: "defender"},
  {name: "Jordi Alba", shooting:69, passing:75, defense:81, foul:25, dribbling:83, team_id:2, user_team_ids: [2], position: "defender"},
  {name: "Ivan Rakitic", shooting:84, passing:86, defense:59, foul:25, dribbling:82, team_id:2, user_team_ids: [2], position: "midfielder"},
  {name: "Sergio Busquets", shooting: 59, passing:79, defense:83, foul:25, dribbling:74, team_id:2, user_team_ids: [2], position: "midfielder"},
  {name: "Sergi Roberto", shooting:65, passing:82, defense:70, foul:25, dribbling:76, team_id:2,  user_team_ids: [2], position: "midfielder"},
  {name: "Gerard Deulofeu", shooting:69, passing:73, defense:26, foul:25, dribbling:87, team_id:2,  user_team_ids: [2], position: "forward"},
  {name: "Keylor Navas", shooting:20, passing:60, defense:94, foul:34, dribbling:30, team_id:1,  user_team_ids: [1], position:"goalie"},
  {name: "Marcelo",shooting:72, passing:85, defense:85, foul:25, dribbling:86, team_id:1,  user_team_ids: [1], position:"defender"},
  {name: "Isco",shooting:87, passing:90, defense:50, foul:25, dribbling:91, team_id:1,  user_team_ids: [1], position:"midfielder"},
  {name: "Nacho Fernandez",shooting:37, passing:65, defense:81, foul:25, dribbling:62, team_id:1,  user_team_ids: [1], position: "defender"},
  {name: "Toni Kroos",shooting:80, passing:88, defense:69, foul:25, dribbling:79, team_id:1,  user_team_ids: [1], position: "midfielder"},
  {name: "Dani Carvajal",shooting:45, passing:72, defense:81, foul:34, dribbling:79, team_id:1,  user_team_ids: [1], position:"defender"},
  {name: "Casemiro",shooting: 68, passing:72 , defense:82, foul:25, dribbling:72, team_id:1,  user_team_ids: [1], position:"midfielder"},
  {name: "Gareth Bale",shooting:87, passing:84, defense:57, foul:25, dribbling:86, team_id:1,  user_team_ids: [1], position:"forward"},
  {name: "Sadio Mane",shooting:93, passing:92, defense:48, foul:10, dribbling:96, team_id:6,  user_team_ids: [3], position:"forward"},
  {name: "Adam Lallana",shooting:89, passing:92, defense:73, foul:15, dribbling:95, team_id:6,  user_team_ids: [3], position:"midfielder"},
  {name: "Daniel Sturridge",shooting:86, passing:74, defense:35, foul:15, dribbling:85, team_id:6,  user_team_ids: [3], position:"forward"},
  {name: "James Milner",shooting:82, passing:89, defense:80, foul:15, dribbling:85, team_id:6,  user_team_ids: [3], position:"defender"},
  {name: "Loris Karius",shooting:30, passing:84, defense:80, foul:1, dribbling:35, team_id:6,  user_team_ids: [3], position:"goalie"},
  {name: "Emre Can",shooting:83, passing:88, defense:88, foul:15, dribbling:87, team_id:6,  user_team_ids: [3], position:"midfielder"},
  {name: "Roberto Firmino",shooting:85, passing:87, defense:52, foul:15, dribbling:90, team_id:6, user_team_ids: [3], position:"forward"},
  {name: "Ragnar Klavan",shooting:48, passing:63, defense:79, foul:15, dribbling:62, team_id:6, user_team_ids: [3], position:"defender"},
  {name: "Mamadou Sakho",shooting:33, passing:62, defense:50, foul:25, dribbling:56, team_id:6, user_team_ids: [3], position:"defender"},
  {name: "Jordan Henderson",shooting:33, passing:62, defense:50, foul:15, dribbling:56, team_id:6, user_team_ids: [3], position:"midfielder"},
  {name: "Petr Cech",shooting:39, passing:45, defense:90, foul:25, dribbling:51, team_id:3, user_team_ids: [4], position:"goalie"},
  {name: "Mesut Ozil",shooting:74, passing:86, defense:24, foul:25, dribbling:86, team_id:3, user_team_ids: [4], position:"midfielder"},
  {name: "Santiago Gonzalez",shooting:78, passing:85, defense:57, foul:25, dribbling:86, team_id:3, user_team_ids: [4], position:"midfielder"},
  {name: "Alex Iwobi",shooting:61, passing:66, defense:28, foul:25, dribbling:82, team_id:3, user_team_ids: [4], position:"midfielder"},
  {name: "Mohamed Elneny",shooting:67, passing:73, defense:73, foul:25, dribbling:70, team_id:3, user_team_ids: [4], position:"midfielder"},
  {name: "Olivier Giroud",shooting:90, passing:82, defense:47, foul:25, dribbling:81, team_id:3, user_team_ids: [4], position:"forward"},
  {name: "Lucas Perez",shooting:83, passing:76, defense:31, foul:25, dribbling:80, team_id:3, user_team_ids: [4], position:"forward"},
  {name: "Laurent Koscielny",shooting:40, passing:62, defense:85, foul:25, dribbling:65, team_id:3, user_team_ids: [4], position:"defender"},
  {name: "Shkodran Mustafi",shooting:63, passing:70, defense:87, foul:25, dribbling:65, team_id:3, user_team_ids: [4], position:"defender"},
  {name: "Per Mertesacker",shooting:41, passing:56, defense:88, foul:25, dribbling:48, team_id:3, user_team_ids: [4], position:"defender"},
  {name: "Pierre Aubameyang",shooting:87, passing:81, defense:40, foul:25, dribbling:84, team_id:4, user_team_ids: [5], position:"forward"},
  {name: "Marco Reus",shooting:89, passing:90, defense:48, foul:25, dribbling:91, team_id:4, user_team_ids: [5], position:"forward"},
  {name: "Adrien Ramos",shooting:74, passing:66, defense:37, foul:25, dribbling:74, team_id:4, user_team_ids: [5], position:"forward"},
  {name: "Ousmane Dembele",shooting:83, passing:88, defense:50, foul:25, dribbling:91, team_id:4, user_team_ids: [5], position:"midfielder"},
  {name: "Mario Gotze",shooting:70, passing:78, defense:31, foul:25, dribbling:89, team_id:4, user_team_ids: [5], position:"midfielder"},
  {name: "Gonzalo Castro",shooting:78, passing:85, defense:75, foul:25, dribbling:84, team_id:4, user_team_ids: [5], position:"forward"},
  {name: "Sokratis",shooting:65, passing:67, defense:91, foul:25, dribbling:74, team_id:4, user_team_ids: [5], position:"defender"},
  {name: "Marcel Schmelzer",shooting:51, passing:69, defense:79, foul:25, dribbling:69, team_id:4, user_team_ids: [5], position:"defender"},
  {name: "Sven Bender",shooting:54, passing:63, defense:84, foul:25, dribbling:63, team_id:4, user_team_ids: [5], position:"defender"},
  {name: "Roman Burki",shooting:20, passing:50, defense:88, foul:5, dribbling:70, team_id:4, user_team_ids: [5], position:"goalie"},
  {name: "Romelu Lukaku",shooting:82, passing:66, defense:34, foul:25, dribbling:74, team_id:5, user_team_ids: [6], position:"forward"},
  {name: "Marcus Rashford",shooting:74, passing:67, defense:31, foul:25, dribbling:80, team_id:5, user_team_ids: [6], position:"forward"},
  {name: "Henrikh Mkhitaryan",shooting:83, passing:86, defense:71, foul:25, dribbling:89, team_id:5, user_team_ids: [6], position:"midfielder"},
  {name: "Wayne Rooney",shooting:88, passing:85, defense:57, foul:25, dribbling:84, team_id:5, user_team_ids: [6], position:"midfielder"},
  {name: "Nemanja Matic",shooting:70, passing:76, defense:81, foul:25, dribbling:72, team_id:5, user_team_ids: [6], position:"midfielder"},
  {name: "Chris Smalling",shooting:46, passing:56, defense:84, foul:25, dribbling:62, team_id:5, user_team_ids: [6], position:"defender"},
  {name: "Antonio Valencia",shooting:66, passing:74, defense:78, foul:25, dribbling:81, team_id:5, user_team_ids: [6], position:"defender"},
  {name: "Daley Blind",shooting:56, passing:77, defense:81, foul:25, dribbling:76, team_id:5, user_team_ids: [6], position:"defender"},
  {name: "David De Gea",shooting:20, passing:55, defense:97, foul:5, dribbling:65, team_id:5, user_team_ids: [6], position:"goalie"},
  {name: "Thomas Muller",shooting:86, passing:77, defense:46, foul:25, dribbling:78, team_id:8, user_team_ids: [7], position:"forward"},
  {name: "Arjen Robben",shooting:90, passing:87, defense:46, foul:25, dribbling:92, team_id:8, user_team_ids: [7], position:"forward"},
  {name: "Thiago Alcantara",shooting:88, passing:92, defense:70, foul:25, dribbling:94, team_id:8, user_team_ids: [7], position:"midfielder"},
  {name: "James Rodriguez",shooting:85, passing:85, defense:40, foul:25, dribbling:85, team_id:8, user_team_ids: [7], position:"midfielder"},
  {name: "Frank Ribery",shooting:76, passing:83, defense:25, foul:25, dribbling:90, team_id:8, user_team_ids: [7], position:"midfielder"},
  {name: "Jerome Boateng",shooting:50, passing:72, defense:89, foul:25, dribbling:67, team_id:8, user_team_ids: [7], position:"defender"},
  {name: "Phillip Lahm",shooting:56, passing:82, defense:86, foul:25, dribbling:84, team_id:8, user_team_ids: [7], position:"defender"},
  {name: "David Alaba",shooting:73, passing:81, defense:83, foul:25, dribbling:83, team_id:8, user_team_ids: [7], position:"defender"},
  {name: "Manuel Neur",shooting:30, passing:40, defense:99, foul:5, dribbling:30, team_id:8, user_team_ids: [7], position:"goalie"},
  {name: "Edinson Cavani",shooting:89, passing:77, defense:48, foul:25, dribbling:86, team_id:9, user_team_ids: [8], position:"forward"},
  {name: "Goncalo Guedes",shooting:76, passing:70, defense:35, foul:25, dribbling:77, team_id:9, user_team_ids: [8], position:"forward"},
  {name: "Angel Di Maria",shooting:88, passing:90, defense:57, foul:25, dribbling:92, team_id:9, user_team_ids: [8], position:"midfielder"},
  {name: "Blaise Matuidi",shooting:67, passing:78, defense:83, foul:25, dribbling:76, team_id:9, user_team_ids: [8], position:"midfielder"},
  {name: "Marco Verratti",shooting:60, passing:86, defense:80, foul:25, dribbling:89, team_id:9, user_team_ids: [8], position:"midfielder"},
  {name: "Javier Pastore",shooting:77, passing:84, defense:58, foul:25, dribbling:86, team_id:9, user_team_ids: [8], position:"midfielder"},
  {name: "Thiago Silva",shooting:57, passing:73, defense:90, foul:25, dribbling:73, team_id:9, user_team_ids: [8], position:"defender"},
  {name: "Dani Alves",shooting:70, passing:76, defense:78, foul:25, dribbling:82, team_id:9, user_team_ids: [8], position:"defender"},
  {name: "Serge Aurier",shooting:66, passing:73, defense:80, foul:25, dribbling:77, team_id:9, user_team_ids: [8], position:"defender"},
  {name: "Kevin Trapp",shooting:20, passing:45, defense:92, foul:5, dribbling:35, team_id:9, user_team_ids: [8], position:"goalie"}
  {name: "Kevin Gameiro",shooting:89, passing:84, defense:40, foul:25, dribbling:85, team_id:7, user_team_ids: [9], position:"forward"}
  {name: "Yannick Carrasco",shooting:78, passing:76, defense:29, foul:25, dribbling:87, team_id:7, user_team_ids: [9], position:"midfielder"}
  {name: "Nicolas Gaitan",shooting:74, passing:83, defense:39, foul:25, dribbling:86, team_id:7, user_team_ids: [9], position:"midfielder"}
  {name: "Koke",shooting:75, passing:85, defense:55, foul:25, dribbling:82, team_id:7, user_team_ids: [9], position:"midfielder"}
  {name: "Gabriel Arenas",shooting:72, passing:80, defense:73, foul:25, dribbling:76, team_id:7, user_team_ids: [9], position:"midfielder"}
  {name: "Diego Godin",shooting:48, passing:65, defense:88, foul:25, dribbling:63, team_id:7, user_team_ids: [9], position:"defender"}
  {name: "Filipe Luis",shooting:62, passing:77, defense:82, foul:25, dribbling:77, team_id:7, user_team_ids: [9], position:"defender"}
  {name: "Juan-Fran Belen",shooting:58, passing:74, defense:79, foul:25, dribbling:77, team_id:7, user_team_ids: [9], position:"defender"}
  {name: "Jan Oblak",shooting:20, passing:40, defense:93, foul:5, dribbling:35, team_id:7, user_team_ids: [9], position:"goalie"}
]

players.each {|p| Player.create(p)}

Player.all.each do |player|
  player.salary
  player.save
end
