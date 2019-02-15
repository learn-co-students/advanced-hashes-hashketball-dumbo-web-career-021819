require "pry"
def game_hash
  game_hash = {:home => {
                    :team_name => "Brooklyn Nets",
                    :colors => ["Black", "White"],
                    :players => {
                      "Alan Anderson" => {
                        :number => 0,
                        :shoe => 16,
                        :points => 22,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 3,
                        :blocks => 1,
                        :slam_dunks => 1
                      },
                      "Reggie Evans" => {
                        :number => 30,
                        :shoe => 14,
                        :points => 12,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 12,
                        :blocks => 12,
                        :slam_dunks => 7
                      },
                      "Brook Lopez" => {
                        :number => 11,
                        :shoe => 17,
                        :points => 17,
                        :rebounds => 19,
                        :assists => 10,
                        :steals => 3,
                        :blocks => 1,
                        :slam_dunks => 15
                      },
                      "Mason Plumlee" => {
                        :number => 1,
                        :shoe => 19,
                        :points => 26,
                        :rebounds => 12,
                        :assists => 6,
                        :steals => 3,
                        :blocks => 8,
                        :slam_dunks => 5
                      },
                      "Jason Terry" => {
                        :number => 31,
                        :shoe => 15,
                        :points => 19,
                        :rebounds => 2,
                        :assists => 2,
                        :steals => 4,
                        :blocks => 11,
                        :slam_dunks => 1
                      }
                    }
  },
               :away => {:team_name => "Charlotte Hornets",
               :colors => ["Turquoise", "Purple"],
               :players => {
                 "Jeff Adrien" => {
                   :number => 4,
                   :shoe => 18,
                   :points => 10,
                   :rebounds => 1,
                   :assists => 1,
                   :steals => 2,
                   :blocks => 7,
                   :slam_dunks => 2
                 },
                 "Bismak Biyombo" => {
                   :number => 0,
                   :shoe => 16,
                   :points => 12,
                   :rebounds => 4,
                   :assists => 7,
                   :steals => 7,
                   :blocks => 15,
                   :slam_dunks => 10
                 },
                 "DeSagna Diop" => {
                   :number => 2,
                   :shoe => 14,
                   :points => 24,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 4,
                   :blocks => 5,
                   :slam_dunks => 5
                 },
                 "Ben Gordon" => {
                   :number => 8,
                   :shoe => 15,
                   :points => 33,
                   :rebounds => 3,
                   :assists => 2,
                   :steals => 1,
                   :blocks => 1,
                   :slam_dunks => 0
                 },
                 "Brendan Haywood" => {
                   :number => 33,
                   :shoe => 15,
                   :points => 6,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 22,
                   :blocks => 5,
                   :slam_dunks => 12
                 }
               }

               }
             }
end

def num_points_scored(player)
score = ""
game_hash.each do |home_away, team_info|
  if team_info[:players].include?(player)
      score = team_info[:players][player][:points]
    end
  end
  return score
end

def player_by_number(num)
  player_array = []
  game_hash.each do |home_away, team_info|
    team_info.each do |category, value|
      if category == :players
        value.each do |name, stats|
          if stats[:number] == num
            player_array << name
          end
        end
      end
    end
  end
  player_array[0]
end

def shoe_size(player)
  size = ""
  game_hash.each do |home_away, team_info|
    if team_info[:players].include?(player)
        size= team_info[:players][player][:shoe]
      end
    end
    return size
  end

def team_colors(team)
  colors = []
  game_hash.each do |home_away, team_info|
    if team_info[:team_name] == team
      colors << team_info[:colors]
    end
  end
  colors.flatten
end

def team_names
  team_name_array = []
  game_hash.each do |home_away, team_info|
    team_name_array << team_info[:team_name]
  end
  team_name_array
end

def player_numbers(team_name)
  numbers_array = []
  game_hash.each do |home_away, team_info|
    if team_info[:team_name] == team_name
    team_info.each do |category, value|
      if category == :players
      value.each do |name, stats|
        stats.each do |type, num|
        if type == :number
          numbers_array << num
        end
      end
    end
  end
    end
  end
end
  numbers_array
end

def player_stats(player_name)
  stat_hash= {}
  game_hash.each do |home_away, team_info|
      team_info.each do |category, value|
          if category == :players
            value.each do |name, stats|
                if name == player_name
                  stats.each do |type,num|
                  stat_hash[type] = num
                end
            end
          end
          end
      end
  end
  return stat_hash
end

def big_shoe_rebounds
  shoe_size = 0
  rebound_stat = 0
  game_hash.each do |home_away, team_info|
    team_info.each do |category, value|
      if category == :players
        value.each do |name, stats|
          stats.each do |type, num|
            if type == :shoe
              if num > shoe_size
              rebound_stat = stats[:rebounds]
              shoe_size = num
            end
          end
        end
      end
    end
  end
end
 return rebound_stat
end

def most_points_scored
most_points = 0
top_player = ""
game_hash.each do |home_away, team_info|
  team_info.each do |category, value|
    if category == :players
      value.each do |name, stats|
        if stats[:points] > most_points
          top_player = name
          most_points = stats[:points]
        end
      end
    end
  end
end
top_player
end

def winning_team
  winner = []
  game_hash.each do |home_away, team_info|
    team_info.each do |category, value|
      point_total = 0
      if category == :players
        value.each do |name, stats|
          point_total += stats[:points]
        end
        winner << team_info[:team_name]
        winner << point_total.to_i
      end
    end
  end
  if winner[1] > winner[3]
    winner[0]
  else
    winner[2]
  end
end

def player_with_longest_name
  player_name_array= []
  game_hash.each do |home_away, team_info|
    team_info.each do |category, value|
      if category == :players
        value. each do |name, stats|
        if player_name_array.size < name.split("").size
          player_name_array.clear
          player_name_array << name.split("")
        end
      end
    end
    end
  end
  player_name_array.join("")
end

def long_name_steals_a_ton?
  player_name_array= []
  longest_name = ""
  most_steals = 0
  true_false = false
  game_hash.each do |home_away, team_info|
    team_info.each do |category, value|
      if category == :players
        value. each do |name, stats|
        if player_name_array.size < name.split("").size && stats[:steals] > most_steals
          true_false = true
          player_name_array.clear
          player_name_array << name.split("")
          most_steals = stats[:steals]
        end
      end
    end
    end
  end
  true_false
end
