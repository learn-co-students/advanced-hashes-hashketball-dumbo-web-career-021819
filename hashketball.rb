# Write your code here!
require "pry"

def game_hash
  {
    :home => {
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
    :away => {
      :team_name => "Charlotte Hornets",
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

# game_hash[:home][:players]["Alan Anderson"][:points]

def player_by_number(number)
  game_hash.each do |side, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |players, stats|
          stats.each do |type, item|
            if type == :number && item == number
              return players
            end
          end
        end
      end
    end
  end
end


def num_points_scored(player_name)
  points_scored = []
  game_hash.each do |side, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            stats.each do |type, number|
              if type == :points
                points_scored << number
                # binding.pry
              end
            end
          end
        end
      end
    end
  end
  points_scored[0]
end

def shoe_size(player_name)
  shoe = []
  game_hash.each do |side, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            stats.each do |type, number|
              if type == :shoe
                shoe << number
                # binding.pry
              end
            end
          end
        end
      end
    end
  end
  shoe[0]
end

def team_colors(team)
  game_hash.each do |side, team_data|
    team_data.each do |attribute, data|
      if data == team
        return team_data[:colors]
      end
    end
  end
end

def team_names
  names = []
  game_hash.each do |side, team_data|
    team_data.each do |attributes, data|
      if attributes == :team_name
        names << data
      end
    end
  end
  names
end

def player_numbers(team)
  numbers = []
  game_hash.each do |side, team_data|
    team_data.each do |attribute, data|
      if data.include?(team)
        team_data[:players].each do |player, player_data|
          player_data.each do |stat, number|
            if stat == :number
              numbers << number
              # binding.pry
            end
          end
        end
      end
    end
  end
  numbers
end

def player_stats(player_name)
  game_hash.each do |side, team_data|
    team_data.each do |attributes, data|
      if attributes == :players
        data.each do |player, stats|
          if player == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  the_shoe = [0]
  player_w_biggest_shoe = ""
  players = [
    "Alan Anderson",
    "Reggie Evans",
    "Brook Lopez",
    "Mason Plumlee",
    "Jason Terry",
    "Jeff Adrien",
    "Bismak Biyombo",
    "DeSagna Diop",
    "Ben Gordon",
    "Brendan Haywood"]

  players.each do |player|
    if shoe_size(player) > the_shoe[0]
      the_shoe[0] = shoe_size(player)
      player_w_biggest_shoe = player
    end
  end
  player_rebounds = player_stats(player_w_biggest_shoe)[:rebounds]
end

puts player_by_number(33)
