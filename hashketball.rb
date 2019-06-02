require "pry"

# Write your code here!


def game_hash


  game_hash = {


     :home => {


     :team_name => 'Brooklyn Nets',
    :colors => ['black', 'white'],
    :players => [
      {player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      {player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      {player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      {player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      {player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
    },
   :away => {
     :team_name => 'Charlotte Hornets',
    :colors => ['turquoise', 'purple'],
    :players => [
      {player_name: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      {player_name: 'Bismak Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
      {player_name: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      {player_name: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      {player_name: 'Brendan Haywood', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      ]
    }
  }
end

def num_points_scored(player_name) #sends back the points per player
  answer = nil
  game_hash.values.each do |team|
      team[:players].each do |player|
        if player.has_value?(player_name)
          answer = player[:points]
          #binding.pry
        end
      end
    end
  answer
end

def shoe_size(player_name) # sends the shoe size of each player
size = nil
game_hash.values.each do |team|
    team[:players].each do |player|
      if player.has_value?(player_name)
        size = player[:shoe]
      end
    end
  end
size
end

def team_colors(team_name) # sends teams colors depending on team specified
color = nil
game_hash.values.each do |team|
    if team[:team_name] == (team_name)
      color = team[:colors].map(&:capitalize)
      #map is used to iterate through hash and upercase color array
      end
    end
#binding.pry
color
end

def team_names #returns an array of team names
  game_hash.values.collect {|team| team[:team_name]}
end

def player_numbers(team_name)
jersey = []
game_hash.values.each do |team|
    team[:players].each do |player|
      if team.has_value?(team_name) #seporates by team_name
      jersey << player[:number] #pushes numbers to jersey array
      end
    end
  end
jersey
end

def player_stats(player_name)# gives stats of all players
game_hash.values.each do |team|
 team[:players].each do |player|
   #binding.pry
   if player.has_value?(player_name)
      player.delete(:player_name)
      return player
      end
    end
  end
end

def big_shoe_rebounds#shows # of rebounds for the biggest feet
big_feet = 0
rebounds = 0
game_hash.values.each do |team|
  team[:players].each do |player|
     player[:shoe] > big_feet
     rebounds = player[:rebounds]
    end
  end
  rebounds
end

def most_points_scored #which player scored the most
  most_scores = 0
  shot_taker = nil
  game_hash.values.each do |team|
    team[:players].each do |player|
      if player[:points] > most_scores
        most_scores = player[:points]
        shot_taker = player[:player_name]
      #  binding.pry
      end
    end
  end
shot_taker
end

def winning_team #which team won the game
  best_team = {}
  game_hash.values.each do |team_stats|
    team_points = 0
    team_stats[:players].each do |player|
      team_points = team_points + player[:points]
    end
    best_team[team_stats[:team_name]] = team_points
  end
  best_team.key(best_team.values.max)
  #binding.pry
end

def player_with_longest_name #shows longest player naem
longest_name = []
game_hash.values.each do |team|
  team[:players].each do |player|
    #if player[:palyer_name].length > longest_name
      longest_name << player[:player_name]
#    end
  end
end
longest_name.max_by {|names| names.length}
end

def long_name_steals_a_ton? #returns T or F if most steals player has longest name
  longest_name = {}
  game_hash.values.each do |team|
    team[:players].each do |player|
      longest_name[player[:player_name]] = player[:steals]
    end
  end
most_steals = longest_name.values.max
longest_name[longest_name.key(most_steals)] == most_steals
#binding.pry
end
