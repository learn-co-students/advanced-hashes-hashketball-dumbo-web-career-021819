require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
     }
    }
end

def num_points_scored(player_name)
  game_hash.map do |team, info|
    game_hash[team][:players].map do |player, info|
      if player_name == player
        return info[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.map do |team, info|
    game_hash[team][:players].map do |player, info|
      if player_name == player
        return info[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.map do |team, info|
    if team_name == info[:team_name]
      return info[:colors]
    end
  end
end

def team_names
  new_array = []
  game_hash.each do |team, info|
    new_array.push(info[:team_name])
  end
  return new_array
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |team, info|
    if team_name == info[:team_name]
      info[:players].each do |player, stats|
        jersey_numbers.push(stats[:number])
      end
    end
  end
  return jersey_numbers
end

def player_stats(player_name)
  game_hash.map do |team, info|
    info[:players].map do |player, stats|
      if player_name == player
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  game_hash.map do |team, info|
    info[:players].map do |player, stats|
      if stats[:shoe] > biggest_shoe
        biggest_shoe = stats[:shoe]
        return stats[:rebounds]
      end
    end
  end
end

def most_points_scored
  most_points = 0
  game_hash.map do |team, info|
    info[:players].map do |player, stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        return player
      end
    end
  end
end

#def winning_team
#  total_points_a = 0
#  total_points_b = 0
#  game_hash.map do |team, info|
#    info[:players].map do |player, stats|
#      total_points_a += stats[:points]
#
#end

def player_with_longest_name
  game_hash.map do |team, info|
    player_name_array = info[:players].keys
    longest_name = "Alan Anderson"
    player_name_array.map do |names|
      if names.length > longest_name.length
        longest_name = names
        return longest_name
      end
    end
  end
end
