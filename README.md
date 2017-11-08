# Fantasy Futbol

Create a team of your favorite players, or use an existing team and simulate matches!

![alt text](https://raw.githubusercontent.com/bother7/rails-project-mode-web-071717/master/public/welcome.png)

## Description

Existing players have a salary associated with them. Create new players with the ratings you want. Construct a fantasy soccer team under the budget, and pit your team in simulated matches against any other team.

### Simulation

The simulator is a series of decision trees with probabilities associated to each outcome. The probabilities are determined by your players' ratings and the opposing teams. The AliasTable gem was used to associate probabilities to different "random" outcomes

![alt text](https://raw.githubusercontent.com/bother7/rails-project-mode-web-071717/master/public/simulation.png)

### Getting Started

clone
bundle install
rails db:create
rails db:migrate
rails db:seed
rails s

## Authors

* **Joe Cha** - *Initial work* - [bother7](https://github.com/bother7)
* **Roman Mullady** - *Initial work* - [SchruteFarms23](https://github.com/SchruteFarms23)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
