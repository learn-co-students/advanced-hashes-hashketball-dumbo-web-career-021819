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

def shoe_size(player_name)
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

def team_colors(team_name)
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

def player_stats(player_name)
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

def big_shoe_rebounds
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

def most_points_scored
  most_scores = 0
  shot_taker = nil
  game_hash.values.each do |team|
    team[:players].each do |player|
      if player[:points] > most_scores
        most_scores = player[:points]
        shot_taker = player[:player_name]
        binding.pry
      end
    end
  end
shot_taker
end


# #==========================================vfocus code
# def game_hash
# {
#   :home =>{
#     :team_name => "Brooklyn Nets",
#     :colors => ["Black", "White"],
#     :players => {
#   "Alan Anderson": {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
#   "Reggie Evans": { number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
#   "Brook Lopez": {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
#   "Mason Plumlee": {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
#   "Jason Terry": {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
#   }
# },
#   :away =>{
#     :team_name => "Charlotte Hornets",
#     :colors => ["Turquoise", "Purple"],
#     :players => {
#        "Jeff Adrien": {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
#       "Bismak Biyombo": {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
#       "DeSagna Diop": {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
#       "Ben Gordon": {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
#       "Jason Terry": {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
#   }
# }
# }
# end
# #==========================================^good code
#
# def num_points_scored(player_names)
#binding.pry==================================================
#   new_thing = game_hash[:home][:players].merge(game_hash[:away][:players])
#   #new_thing.fetch(points)
# if new_thing[:players] == player_names
#   puts t_f
#   #answer = new_thing.fetch("points")
# end
#
# binding.pry
# end=========================================================
#focus code v
 #  scores = []
 #  game_hash.each do |teams, data|
 #    binding.pry
 #    data[:players].each do |stats|
 #      binding.pry
 #
 #
 #            if stats[:name].values == player_names
 #               scores = stats[:points]
 #              binding.pry
 #            end
 #      end
 #    end
 # scores
 #
 #
 #  end


#num_points_scored(player_names)===============================================


  #   score =[]
  # game_hash[:away][:players].each do |names, data|
  #     score = data[:points]
  # #binding.pry
  #       score

#   player_stats
# end

# home_points = game_hash[:home][:players].each {|points, value|}
# away_points = game_hash[:home][:players].each {|points, value|}
# end

# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
#
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end
# #good_practices
